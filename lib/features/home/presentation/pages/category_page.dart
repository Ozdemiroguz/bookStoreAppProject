import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/custom/custom_app_bar.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:book_store/features/home/presentation/widgets/widgets.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
//statefull widget
class CategoryPage extends HookConsumerWidget {
  final BookCategory bookCategory;

  const CategoryPage({required this.bookCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksState = ref.watch(booksProviders);

    return booksState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: CustomAppBar(
              actions: [
                Text(
                  booksState.selectedCategoryId == -1
                      ? 'All Books'
                      : //if selectedCategoryId is -1, show 'All Books' else show the name of the category that has the id of selectedCategoryId in

                      booksState.bookCategories
                          .firstWhere(
                            (element) =>
                                element.id == booksState.selectedCategoryId,
                          )
                          .name,
                  style: bLabelLarge,
                ),
              ],
              
            ),
            body: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.r,
                    right: 20.r,
                    top: 33.r,
                  ),
                  child: Column(
                    children: [
                      SearchFilterBar(),
                       SizedBox(height: 40.h),
                      GridWidget(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class GridWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksState = ref.watch(booksProviders);

    return booksState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : booksState.filteredBooks[booksState.selectedCategoryId] == null ||
                booksState.filteredBooks[booksState.selectedCategoryId]!.isEmpty
            ? Center(
                child: Text(
                  'No books found!',
                  style: labelMedium.copyWith(
                    color: lightGray,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: booksState
                    .filteredBooks[booksState.selectedCategoryId]!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 170.w / 284.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(
                    book: booksState
                        .filteredBooks[booksState.selectedCategoryId]![index],
                  );
                },
              );
  }
}

class BookWidget extends StatelessWidget {
  final Book book;
  const BookWidget({required this.book});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(BookRoute(book: book));
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: ShapeDecoration(
          color: Color(0xfff4f4ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                
                decoration: BoxDecoration(
                  color:white ,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      color: purple.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 4.8,
                    ),
                  ],
                  
                  image: DecorationImage(
                    //fotğrafa yakkınlaşma
                    
                    image: NetworkImage(book.image!
                    ),
                  ),
                ),
                
                
              
              
              
              ),
            ),
            SizedBox(height: 10.h),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  book.name,
                  style: bLabelSmall.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    
                    
                    
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          book.author,
                          style: bLabelSmall.copyWith(
                            color: darkBlue3.withOpacity(.6),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,  
                        
                        ),
                        
                        ),
                      ),
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "${book.price}\$",
                        style: bLabelSmall.copyWith(
                          color: purple,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
