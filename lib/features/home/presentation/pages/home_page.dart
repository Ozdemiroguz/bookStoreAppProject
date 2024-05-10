import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/custom/custom_app_bar.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:book_store/features/home/presentation/widgets/widgets.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  @override
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksState = ref.watch(booksProviders);

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Text(
            "Catalog",
            style: bLabelLarge,
          ),
        ],
        leading: SizedBox(
          child: Assets.icons.logo.svg(height: 32.h, width: 32.w),
        ),
      ),
      body: booksState.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : booksState.bookCategories.isEmpty
              ? const Center(child: Text("No categories found"))
              : ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20.r,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryBar(),
                            SearchFilterBar(),
                            SingleChildScrollView(
                              child: Column(
                                children: booksState.categoryIds.isEmpty
                                    ? [
                                        const Center(
                                            child: Text("No books found"))
                                      ]
                                    : booksState.categoryIds
                                        .map((e) => CategoryBooksWidget(
                                            bookCategory: booksState
                                                .bookCategories
                                                .firstWhere((element) =>
                                                    element.id == e)))
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}

// ignore: must_be_immutable
class CategoryBar extends ConsumerWidget {
  String selectCategory = "All";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(booksProviders);

    return Padding(
      padding: EdgeInsets.only(
        top: 28.r,
        bottom: 20.r,
      ),
      child: SizedBox(
        height: 42.r,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bookState.bookCategories.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? CategoryName(
                    bookCategory:
                        BookCategory(id: -1, name: "All", created_at: ''))
                : CategoryName(
                    bookCategory: bookState.bookCategories[index - 1]);
          },
        ),
      ),
    );
  }
}

class CategoryName extends ConsumerWidget {
  final BookCategory bookCategory;

  const CategoryName({required this.bookCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(booksProviders);

    final bool selectedFlag = (bookState.selectedCategoryId == bookCategory.id);
    return Padding(
      padding: EdgeInsets.only(right: 10.0.r),
      child: GestureDetector(
        onTap: () {
          ref
              .read(booksProviders.notifier)
              .categoryFilterChanged(bookCategory.id);
        },
        child: Container(
          //borderradius
          decoration: BoxDecoration(
            color: selectedFlag ? const Color(0xff6251DD) : softBack,
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding: EdgeInsets.only(
            left: 20.r,
            right: 20.r,
            top: 10.r,
            bottom: 10.r,
          ),
          child: Center(
            child: Text(
              bookCategory.name,
              style: textFieldStyle.copyWith(
                color: selectedFlag ? Colors.white : Colors.grey,
                fontWeight: selectedFlag ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
    // TODO: implement build
  }
}

class CategoryBooksWidget extends ConsumerWidget {
  final BookCategory bookCategory;

  const CategoryBooksWidget({required this.bookCategory});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(booksProviders);

    return bookState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : bookState.filteredBooks.isEmpty ||
                bookState.filteredBooks[bookCategory.id]!.isEmpty
            ? const Center(child: Text("No books found"))
            : Padding(
                padding: EdgeInsets.only(top: 40.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20.r,
                        bottom: 20.r,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bookCategory.name,
                            style: bLabelLarge,
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(booksProviders.notifier)
                                  .categoryFilterChanged(bookCategory.id);
                              context.pushRoute(
                                CategoryRoute(
                                  bookCategory: bookState.bookCategories
                                      .firstWhere((element) =>
                                          element.id == bookCategory.id),
                                ),
                              );
                            },
                            child: Text(
                              'View all',
                              style: bodyMedium.copyWith(
                                  color: orange,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (bookState.books.length > 1)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final book
                                in bookState.filteredBooks[bookCategory.id]!)
                              Padding(
                                padding: EdgeInsets.only(right: 10.r),
                                child: BookDetails(book: book),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
  }
}

class BookDetails extends ConsumerWidget {
  final Book book;

  const BookDetails({required this.book, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.pushRoute(BookRoute(book: book)),
      child: Container(
        padding: EdgeInsets.all(10.r),
        color: softBack,
        child: Row(
          children: [
            if (book.image == null)
              const Icon(
                Icons.image,
                size: 80,
              )
            else
              Container(
                width: 80.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6251DD).withOpacity(.2),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      book.image!,
                    ),
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
              ),
              height: 120.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book.name, style: bLabelSmall),
                        Text(
                          book.author,
                          style: bodyMedium.copyWith(
                            color: Colors.grey,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${book.price} \$",
                    style: bodyMedium.copyWith(
                      color: purple,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
