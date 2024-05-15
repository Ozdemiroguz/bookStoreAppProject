import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constans.dart';
import '../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final double bottomHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.toolbarHeight,
    this.bottom,
    this.bottomHeight = 0,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top:55.h,
        bottom: 20.h,
        
        
      ),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: Color(0xfff4f4ff),
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: 
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                  GestureDetector(
                    onTap: onBackPressed ??
                        () {
                          context.router.pop();
                        },
                    child: leading ??
                            
                                  
                             const Icon(Icons.arrow_back_ios, ),
                  ),
    
                 //actions null değilse ekle yoksa boş bırak
            if (actions != null)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ),
          
          
               
          ],),
      
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? 24.h)+80.h);
}
