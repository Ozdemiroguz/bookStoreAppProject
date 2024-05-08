import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/custom/custom_app_bar.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:book_store/features/home/presentation/pages/home_page.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:book_store/features/home/presentation/widgets/widgets.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
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
        :
     
        Scaffold(
        appBar: CustomAppBar(
          actions: [
        
          Text(      
            booksState.selectedCategoryId==-1?'All Books': //if selectedCategoryId is -1, show 'All Books' else show the name of the category that has the id of selectedCategoryId in

            booksState.bookCategories.firstWhere((element) => element.id==booksState.selectedCategoryId).name,
            style: labelLarge.copyWith(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,),
          ),
          
        ],
          onBackPressed: () {
                        context.router.pop();

            ref.read(booksProviders.notifier).categoryFilterChanged(-1);
            ref.read(booksProviders.notifier).searchFilterChanged('');
          },
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 20.r,
                right: 20.r,
                top: 40.r,
              ),
              child: Column(
                children: [
                  SearchFilterBar(),
                  GridWidget(),
                
                ],
              ),
            ),
          ),
        ),
           );
    
  }


  


 
}

 
 class  GridWidget extends ConsumerWidget
{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksState = ref.watch(booksProviders);

    return booksState.isLoading
        ? const Center(child: CircularProgressIndicator())
        : booksState.filteredBooks[booksState.selectedCategoryId]==null||booksState.filteredBooks[booksState.selectedCategoryId]!.isEmpty
            ?  Center(
                child: Text(
                  'No books found!',
                  style: labelMedium.copyWith(
                    color: lightGray,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,)
                ),
              )
            : GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: booksState.filteredBooks[booksState.selectedCategoryId]!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 170.w / 284.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(book: booksState.filteredBooks[booksState.selectedCategoryId]![index]);
                },
              );
    
   

  }



}
class BookWidget extends StatelessWidget
{
  final Book book;
  const BookWidget({required this.book});
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
                    onTap: () {
                      context.router.push(BookRoute(book: book));
                      
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            book.image!,
                            width: 170.w,
                            height: 225.h,
                            fit: BoxFit.contain,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.name,
                                  style: TextStyle(
                                    color: const Color(0xFF090937),
                                    fontSize: 10.sp,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Text(
                                        book.author,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: const Color(0x99090937),
                                          fontSize: 8.sp,
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      book.price.toString() + "\$",
                                      style: TextStyle(
                                        color: const Color(0xFF6251DD),
                                        fontSize: 12.sp,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                
           
      
              
     
}
    // TODO: implement build
  }
  



