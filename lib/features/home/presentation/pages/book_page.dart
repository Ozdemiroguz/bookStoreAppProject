import 'package:auto_route/annotations.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/custom/custom_app_bar.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/features/home/domain/models/book.dart';
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
            style: labelLarge.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.r,
          right: 20.r,
          top: 20.r,
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
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite_border,
                  color: purple,
                  size: 30.r,
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
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
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
        Column(
          children: [
            Text(
              book.name,
              style: titleLarge.copyWith(
                color: Colors.black,
                height: 2.7.w,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              book.author,
              style: bodyMedium.copyWith(
                color: Colors.grey,
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
            'Sumary',
            style: titleLarge.copyWith(
              color: Colors.black,
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
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
