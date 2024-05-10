import 'package:book_store/core/injections/locator.dart';
import 'package:book_store/features/home/presentation/states/categrories/categories_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesProvider =
    NotifierProvider<_CategoriesNotifier, CategoriesState>(
        _CategoriesNotifier.new);

final class _CategoriesNotifier extends Notifier<CategoriesState> {
  @override
  CategoriesState build() {
    Future(() => init());
    return CategoriesState.initial();
  }

  Future<void> init() async {
    setLoading(true);

    final result = await ref.read(homeRepositoryProvider).getCategories();

    state = state.copyWith(
      categories: result.getOrElse((l) => []),
      failure: result.getLeft(),
      isLoading: false,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
