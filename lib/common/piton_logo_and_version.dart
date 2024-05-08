import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bootstrap.dart';
import '../constants/colors.dart';
import '../gen/assets.gen.dart';

class PitonLogoAndVersionInfo extends StatelessWidget {
  const PitonLogoAndVersionInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.pitonLogo.svg(
          width: 96.w,
          height: 32.h,
        ),
        SizedBox(height: 20.h),
        Text(
          'v$appVersion',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: gray,
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }
}
