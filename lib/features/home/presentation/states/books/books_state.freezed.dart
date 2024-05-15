// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BooksState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<int, List<Book>> get books => throw _privateConstructorUsedError;
  Map<int, List<Book>> get filteredBooks => throw _privateConstructorUsedError;
  Map<int, Option<Failure>> get failures => throw _privateConstructorUsedError;
  List<BookCategory> get bookCategories => throw _privateConstructorUsedError;
  List<int> get categoryIds => throw _privateConstructorUsedError;
  int get selectedCategoryId => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get favorited => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksStateCopyWith<BooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<int, List<Book>> books,
      Map<int, List<Book>> filteredBooks,
      Map<int, Option<Failure>> failures,
      List<BookCategory> bookCategories,
      List<int> categoryIds,
      int selectedCategoryId,
      String searchQuery,
      bool favorited});
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? books = null,
    Object? filteredBooks = null,
    Object? failures = null,
    Object? bookCategories = null,
    Object? categoryIds = null,
    Object? selectedCategoryId = null,
    Object? searchQuery = null,
    Object? favorited = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Book>>,
      filteredBooks: null == filteredBooks
          ? _value.filteredBooks
          : filteredBooks // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Book>>,
      failures: null == failures
          ? _value.failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Map<int, Option<Failure>>,
      bookCategories: null == bookCategories
          ? _value.bookCategories
          : bookCategories // ignore: cast_nullable_to_non_nullable
              as List<BookCategory>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      favorited: null == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksStateImplCopyWith<$Res>
    implements $BooksStateCopyWith<$Res> {
  factory _$$BooksStateImplCopyWith(
          _$BooksStateImpl value, $Res Function(_$BooksStateImpl) then) =
      __$$BooksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<int, List<Book>> books,
      Map<int, List<Book>> filteredBooks,
      Map<int, Option<Failure>> failures,
      List<BookCategory> bookCategories,
      List<int> categoryIds,
      int selectedCategoryId,
      String searchQuery,
      bool favorited});
}

/// @nodoc
class __$$BooksStateImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksStateImpl>
    implements _$$BooksStateImplCopyWith<$Res> {
  __$$BooksStateImplCopyWithImpl(
      _$BooksStateImpl _value, $Res Function(_$BooksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? books = null,
    Object? filteredBooks = null,
    Object? failures = null,
    Object? bookCategories = null,
    Object? categoryIds = null,
    Object? selectedCategoryId = null,
    Object? searchQuery = null,
    Object? favorited = null,
  }) {
    return _then(_$BooksStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Book>>,
      filteredBooks: null == filteredBooks
          ? _value._filteredBooks
          : filteredBooks // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Book>>,
      failures: null == failures
          ? _value._failures
          : failures // ignore: cast_nullable_to_non_nullable
              as Map<int, Option<Failure>>,
      bookCategories: null == bookCategories
          ? _value._bookCategories
          : bookCategories // ignore: cast_nullable_to_non_nullable
              as List<BookCategory>,
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      favorited: null == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BooksStateImpl implements _BooksState {
  _$BooksStateImpl(
      {required this.isLoading,
      required final Map<int, List<Book>> books,
      required final Map<int, List<Book>> filteredBooks,
      required final Map<int, Option<Failure>> failures,
      required final List<BookCategory> bookCategories,
      required final List<int> categoryIds,
      required this.selectedCategoryId,
      required this.searchQuery,
      required this.favorited})
      : _books = books,
        _filteredBooks = filteredBooks,
        _failures = failures,
        _bookCategories = bookCategories,
        _categoryIds = categoryIds;

  @override
  final bool isLoading;
  final Map<int, List<Book>> _books;
  @override
  Map<int, List<Book>> get books {
    if (_books is EqualUnmodifiableMapView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_books);
  }

  final Map<int, List<Book>> _filteredBooks;
  @override
  Map<int, List<Book>> get filteredBooks {
    if (_filteredBooks is EqualUnmodifiableMapView) return _filteredBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filteredBooks);
  }

  final Map<int, Option<Failure>> _failures;
  @override
  Map<int, Option<Failure>> get failures {
    if (_failures is EqualUnmodifiableMapView) return _failures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_failures);
  }

  final List<BookCategory> _bookCategories;
  @override
  List<BookCategory> get bookCategories {
    if (_bookCategories is EqualUnmodifiableListView) return _bookCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookCategories);
  }

  final List<int> _categoryIds;
  @override
  List<int> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  @override
  final int selectedCategoryId;
  @override
  final String searchQuery;
  @override
  final bool favorited;

  @override
  String toString() {
    return 'BooksState(isLoading: $isLoading, books: $books, filteredBooks: $filteredBooks, failures: $failures, bookCategories: $bookCategories, categoryIds: $categoryIds, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, favorited: $favorited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._filteredBooks, _filteredBooks) &&
            const DeepCollectionEquality().equals(other._failures, _failures) &&
            const DeepCollectionEquality()
                .equals(other._bookCategories, _bookCategories) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.favorited, favorited) ||
                other.favorited == favorited));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_filteredBooks),
      const DeepCollectionEquality().hash(_failures),
      const DeepCollectionEquality().hash(_bookCategories),
      const DeepCollectionEquality().hash(_categoryIds),
      selectedCategoryId,
      searchQuery,
      favorited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksStateImplCopyWith<_$BooksStateImpl> get copyWith =>
      __$$BooksStateImplCopyWithImpl<_$BooksStateImpl>(this, _$identity);
}

abstract class _BooksState implements BooksState {
  factory _BooksState(
      {required final bool isLoading,
      required final Map<int, List<Book>> books,
      required final Map<int, List<Book>> filteredBooks,
      required final Map<int, Option<Failure>> failures,
      required final List<BookCategory> bookCategories,
      required final List<int> categoryIds,
      required final int selectedCategoryId,
      required final String searchQuery,
      required final bool favorited}) = _$BooksStateImpl;

  @override
  bool get isLoading;
  @override
  Map<int, List<Book>> get books;
  @override
  Map<int, List<Book>> get filteredBooks;
  @override
  Map<int, Option<Failure>> get failures;
  @override
  List<BookCategory> get bookCategories;
  @override
  List<int> get categoryIds;
  @override
  int get selectedCategoryId;
  @override
  String get searchQuery;
  @override
  bool get favorited;
  @override
  @JsonKey(ignore: true)
  _$$BooksStateImplCopyWith<_$BooksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
