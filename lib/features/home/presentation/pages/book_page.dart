import 'package:auto_route/annotations.dart';
import 'package:book_store/common/backgrounded_icon.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/custom/custom_app_bar.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
//statefull widget
class BookPage extends HookConsumerWidget {
  final Book book;

  const BookPage({required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Text(
            "BookDetails",
            style: bLabelLarge
          ),
        ],
      ),
      body:  Container(
              padding: EdgeInsets.only(
                left: 20.r,
                right: 20.r,
                top: 33.r,
                bottom: 40.r,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImagePart(book: book),
                      SummaryPart(book: book),
                      const Spacer(),
                      ButtonPart(
                        book: book,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      width: 44.w,
                      height:44.h,
                      child: FloatingActionButton(
                        
                        onPressed: () {
                          ref.read(booksProviders.notifier).favoriteBookChanged();
                          print("favorited: ${ref.watch(booksProviders).favorited}");
                        },
                        backgroundColor: Color(0xfff4f4f4),
                        child:Assets.icons.heart.svg(
                          colorFilter: ref.watch(booksProviders).favorited
                              ? const ColorFilter.mode(
                                red,
                                  BlendMode.srcIn,
                                )
                              : null,
            
                        )
            
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  
         
      
    );
  }
}

class ImagePart extends StatelessWidget {
  final Book book;

  const ImagePart({required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.r,
              height: 225.r,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: purple.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
                image: DecorationImage(

                  fit: BoxFit.cover,
                  image: NetworkImage(
                    book.image!,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Column(
          children: [
            Text(
              book.name,
              style: bLabelLarge
            ),
            SizedBox(height: 10.h),
            Text(
              book.author,
              style: bodyMedium.copyWith(
                color: darkBlue3.withOpacity(0.6),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SummaryPart extends StatelessWidget {
  final Book book;

  const SummaryPart({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.r),
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: titleLarge.copyWith(
              color:darkBlue3,
              height: 2.7.w,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.25,
            child: SingleChildScrollView(
              child: Text(
                style: labelSmall.copyWith(
                  color: darkBlue3.withOpacity(0.6),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                book.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonPart extends StatelessWidget {
  final Book book;

  const ButtonPart({required this.book});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CustomFilledButton.orange(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${book.price}\$",
              style: labelMedium.copyWith(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Buy Now",
              style: labelMedium.copyWith(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
