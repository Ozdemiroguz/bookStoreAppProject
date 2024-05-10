import 'package:book_store/core/injections/locator.dart';
import 'package:book_store/core/models/failure/failure.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/presentation/states/books/books_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksProviders = NotifierProvider<_BooksNotifier, BooksState>(
  _BooksNotifier.new,
);

final class _BooksNotifier extends Notifier<BooksState> {
  @override
  BooksState build() {
    Future(() => init());
    return BooksState.initial();
  }

  Future<void> init() async {
    setLoading(true);
    await fetchBookCategories();
    await fetchBooksBydALlId();
    fetchBookImage();
  }

  Future<void> fetchBookCategories() async {
    setLoading(true);
    final result = await ref.read(homeRepositoryProvider).getCategories();
    final Map<int, Option<Failure>> failures = {};

    //failersın o keyi için hata varsa onu ekliyoruz
    failures[0] = result.getLeft();

    state = state.copyWith(
      bookCategories: result.getOrElse((l) => []),
      categoryIds:
          result.getOrElse((l) => []).map((category) => category.id).toList(),
      failures: failures,
      isLoading: false,
    );
  }

  Future<void> fetchBooksBydALlId() async {
    final Map<int, List<Book>> books = {};
    final Map<int, Option<Failure>> failures = Map.from(state.failures);
    Future(() => setLoading(true));

    for (final categoryId in state.categoryIds) {
      final result =
          await ref.read(homeRepositoryProvider).getBooksByCategory(categoryId);
      //teker teker ekliyoruz ve isimnlerin baş harfleri kontrol editoruz

      books[categoryId] = result.getOrElse((l) => []);
      failures[categoryId] = result.getLeft();
    }
    state = state.copyWith(
      books: books,
      filteredBooks: books,
      failures: failures,
      isLoading: false,
    );
  }

  Future<void> fetchBooksByCategoryId(int categoryId) async {
    setLoading(true);

    final result =
        await ref.read(homeRepositoryProvider).getBooksByCategory(categoryId);

    state = state.copyWith(
      books: {
        ...state.books,
        categoryId: result.getOrElse((l) => []),
      },
      failures: {
        ...state.failures,
        categoryId: result.getLeft(),
      },
    );
  }

  Future<void> fetchBookImage() async {
    setLoading(true);
    final Map<int, List<Book>> tempBooks = Map.from(state.books);
    for (final categoryId in state.categoryIds) {
      for (final book in state.books[categoryId]!) {
        final result =
            await ref.read(homeRepositoryProvider).getBookImage(book.cover);
        tempBooks[categoryId] = tempBooks[categoryId]!
            .map(
              (b) => b.id == book.id
                  ? b.copyWith(image: result.getOrElse((l) => ''))
                  : b,
            )
            .toList();
      }
    }

    state = state.copyWith(
      books: tempBooks,
      filteredBooks: tempBooks,
      isLoading: false,
    );
  }

  void categoryFilterChanged(int categoryId) {
    Map<int, List<Book>> filteredBooks = {};
    List<int> categoryIds = [];

    if (categoryId == -1) {
      filteredBooks = state.books;
      categoryIds =
          state.bookCategories.map((category) => category.id).toList();
    } else {
      filteredBooks[categoryId] = state.books[categoryId]!;
      categoryIds.add(categoryId);
    }

    state = state.copyWith(
      filteredBooks: filteredBooks,
      categoryIds: categoryIds,
      selectedCategoryId: categoryId,
    );

    searchFilterChanged(state.searchQuery);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void searchFilterChanged(String search) {
    final Map<int, List<Book>> filteredBooks = {};
    List<int> categoryIds = List.from(state.categoryIds);

    if (search.isEmpty) {
      state.selectedCategoryId == -1
          ? categoryIds =
              state.bookCategories.map((category) => category.id).toList()
          : categoryIds = [state.selectedCategoryId];
      state = state.copyWith(
        filteredBooks: state.books,
        searchQuery: search,
        categoryIds: categoryIds,
      );
      return;
    } else if (state.selectedCategoryId == -1) {
      categoryIds =
          state.bookCategories.map((category) => category.id).toList();
      state.books.forEach((key, bookList) {
        final filteredList = bookList
            .where(
              (book) =>
                  book.name.toLowerCase().contains(search.toLowerCase()) ||
                  book.author.toLowerCase().contains(search.toLowerCase()),
            )
            .toList();
        if (filteredList.isEmpty) {
          categoryIds.remove(
            key,
          ); //tel bir id yoksa allda arama yaptığımız için arayüzde rahat göstermek için boş idleri siliyorum
        }
        filteredBooks[key] = filteredList;
      });
    } else {
      final List<Book> filteredList = state.books[categoryIds[0]]!
          .where(
            (book) =>
                book.name.toLowerCase().contains(search.toLowerCase()) ||
                book.author.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
      filteredBooks[categoryIds[0]] = filteredList;
    }

    state = state.copyWith(
      filteredBooks: filteredBooks,
      searchQuery: search,
      categoryIds: categoryIds,
    );
  }
}
