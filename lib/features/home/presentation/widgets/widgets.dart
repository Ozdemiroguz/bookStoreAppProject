import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFilterBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.r,
      ),
      child: SizedBox(
        height: 50.r,
        child: CustomTextField(
          onChanged: (value) {
            ref.read(booksProviders.notifier).searchFilterChanged(value);
          },
          hintText: 'Search',
          prefixIcon: Padding(
            padding: EdgeInsets.only(
                left: 10.0.r, right: 10.0.r, top: 17.r, bottom: 17.r),
            child: Assets.icons.search.svg(width: 16.r, height: 16.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(
                left: 10.0.r, right: 10.0.r, top: 17.r, bottom: 17.r),
            child: Assets.icons.filter.svg(width: 16.r, height: 16.r),
          ),
        ),
      ),
    );
  }
}
