import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constans.dart';
import '../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
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
        bottom: 0.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0xfff4f4ff),
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: AppBar(
        //shadow with shape

        title: title != null
            ? Text(
                title!,
                overflow: TextOverflow.ellipsis,
                style: bLabelLarge,
              )
            : null,
        leading: leading ??
            (context.router.canPop()
                ? IconButton.filled(
                    onPressed: onBackPressed ?? () => context.popRoute(),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    icon: Assets.icons.arrowLeft.svg(
                      colorFilter: const ColorFilter.mode(
                        darkBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null),
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kAppBarHeight + bottomHeight + 20.h);
}
