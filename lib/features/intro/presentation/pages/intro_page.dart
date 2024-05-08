import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//size of the screen


@RoutePage()
class IntroPage extends StatelessWidget {
  const IntroPage();

  @override
  Widget build(BuildContext context) {
    final double screenWidth=MediaQuery.of(context).size.width;
    return Material(
      color: darkBlue1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 240.r,
                height: 240.r,
                child: Assets.icons.logo.svg(width: 240.r, height: 240.r),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350.w,
                    height: 60,
                    child: CustomFilledButton.orange(
                        onPressed: () {
                          context.router.push(const LoginRoute());
                        },
                        child: Text(
                          'Login',
                          style: labelMedium.copyWith(color: white),
                        ),),
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: TextButton(
                      style: TextButtonTheme.of(context).style?.copyWith(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.transparent;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: labelMedium.copyWith(color: blue),
                      ),
                      onPressed: () {
                        context.router.replace(const HomeRoute());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
