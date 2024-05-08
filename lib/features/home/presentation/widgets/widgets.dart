import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/features/home/presentation/providers/books_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFilterBar extends ConsumerWidget
{

  @override
  Widget build(BuildContext context,WidgetRef ref)
  {
    return Padding(
                    padding: EdgeInsets.only(
                      right: 20.r,
                      bottom: 30.r,
                    ),
                    child: SizedBox(
                      height: 50.r,
                      child:  CustomTextField(
                        onChanged: (value) {
                          ref.read(booksProviders.notifier).searchFilterChanged(value);
                        },
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list_outlined,
                            color: Colors.grey,
                          ),),
                    ),
                  );
  }


}