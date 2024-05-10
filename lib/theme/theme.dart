import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/font_sizes.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constans.dart';
import '../constants/system_ui_overlay_styles.dart';
import '../gen/assets.gen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  scaffoldBackgroundColor: bgColor,
  // outlinedButtonTheme: _outLinedButtonThemeData,
  filledButtonTheme: _filledButtomThemeData,
  // datePickerTheme: _datePickerThemeData,
  floatingActionButtonTheme: _floatingActionButtonThemeData,
  cupertinoOverrideTheme: _cupertinoThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  // bottomSheetTheme: _bottomSheetThemeData,
  primaryColorLight: primary,
  textButtonTheme: _textButtonThemeData,
  actionIconTheme: _actionIconThemeData,
  iconButtonTheme: _iconButtonThemeData,
  dialogBackgroundColor: white,
  // dialogTheme: _dialogTheme,
  primaryColor: primary,
  primaryTextTheme: _textTheme,
  popupMenuTheme: _popupMenuThemeData,
  dividerTheme: _dividerThemeData,
  dividerColor: gray,
  drawerTheme: _drawerThemeData,
  listTileTheme: _listTileThemeData,
  checkboxTheme: _checkboxThemeData,
  radioTheme: _radioThemeData,
  appBarTheme: _appBarTheme,
  textTheme: _textTheme,

  useMaterial3: true,
);

final _filledButtomThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStatePropertyAll(Size.fromHeight(60.r)),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return gray;
        } else {
          return primary;
        }
      },
    ),
    side: const MaterialStatePropertyAll(BorderSide.none),
    padding: MaterialStatePropertyAll(
        EdgeInsets.only(top: 10.r, bottom: 10.r, left: 20.r, right: 20.r)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
    textStyle: MaterialStatePropertyAll(titleMedium.copyWith(color: white)),
    foregroundColor: const MaterialStatePropertyAll(white),
    elevation: const MaterialStatePropertyAll(0),
  ),
);

final _popupMenuThemeData = PopupMenuThemeData(
  color: bgColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  elevation: 0,
  textStyle: titleMedium,
);

final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
  backgroundColor: primary,
  foregroundColor: bgColor,
  elevation: 0,
  focusElevation: 0,
  hoverElevation: 0,
  extendedIconLabelSpacing: 0,
  highlightElevation: 0,
  disabledElevation: 0,
  extendedPadding: EdgeInsets.zero,
  sizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  extendedSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  smallSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  largeSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  iconSize: 36.r,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.r),
    ),
  ),
);

const _cupertinoThemeData = CupertinoThemeData(
  primaryColor: primary,
  applyThemeToAll: true,
  scaffoldBackgroundColor: bgColor,
  barBackgroundColor: Colors.white,
  brightness: Brightness.light,
);

final _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: softBack,
  iconColor: darkBlue,
  suffixIconColor: darkBlue3,
  prefixIconColor: darkBlue,
  hintStyle: labelLarge.copyWith(color: darkBlue3.withOpacity(.4)),
  labelStyle: labelLarge.copyWith(color: darkBlue3),
  errorStyle: bodySmall.copyWith(color: red),
  errorMaxLines: 2,
  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
  floatingLabelStyle: bodySmall.copyWith(color: darkBlue),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    foregroundColor: const MaterialStatePropertyAll(primary),
    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    textStyle:
        MaterialStatePropertyAll(titleMedium.copyWith(fontSize: fontSize14)),
  ),
);

final _actionIconThemeData = ActionIconThemeData(
  backButtonIconBuilder: (context) => IconButton(
    onPressed: context.router.pop,
    icon: Assets.icons.arrowLeft.svg(),
  ),
);

final _iconButtonThemeData = IconButtonThemeData(style: _iconButtonStyle);

final _iconButtonStyle = ButtonStyle(
  foregroundColor: const MaterialStatePropertyAll(primary),
  backgroundColor: const MaterialStatePropertyAll(primary),
  iconColor: const MaterialStatePropertyAll(bgColor),
  padding: MaterialStatePropertyAll(EdgeInsets.all(10.r)),
  shape: const MaterialStatePropertyAll(CircleBorder()),
);

// final _dialogTheme = DialogTheme(
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//   contentTextStyle: bodyLargeMobile.copyWith(color: labelColor),
//   titleTextStyle: titleSmallMobile,
//   backgroundColor: backgroundColor,
//   elevation: 0,
// );

final _dividerThemeData = DividerThemeData(
  color: gray,
  thickness: 1.r,
  space: 0,
);

const _drawerThemeData = DrawerThemeData(
  backgroundColor: darkBlue,
  elevation: 0,
);

final _listTileThemeData = ListTileThemeData(
  contentPadding: EdgeInsets.symmetric(horizontal: 60.w),
  titleTextStyle: titleMedium,
  subtitleTextStyle: bodyMedium.copyWith(color: textColor),
  dense: true,
  textColor: textColor,
  tileColor: bgColor,
  horizontalTitleGap: 0,
  iconColor: purple,
);

final _checkboxThemeData = CheckboxThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  checkColor: const MaterialStatePropertyAll(white),
  shape: RoundedRectangleBorder(
    side: BorderSide(color: primary, width: 1.r),
    borderRadius: BorderRadius.circular(2.r),
  ),
  side: BorderSide(color: purple, width: 2.r),
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) return primary;
    return null;
  }),
);

final _radioThemeData = RadioThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) return primary;
    return gray;
  }),
);

final _appBarTheme = AppBarTheme(
  iconTheme: _iconThemeData,
  systemOverlayStyle: systemUiOverlayDarkStyle,
  actionsIconTheme: _iconThemeData,
  titleTextStyle: titleMedium,
  foregroundColor: bgColor,
  scrolledUnderElevation: 0,
  elevation: 0,
  centerTitle: true,
  toolbarHeight: kAppBarHeight,
  backgroundColor: Colors.transparent,
);

final _iconThemeData = IconThemeData(
  color: darkBlue,
  size: 100.r,
);

final _textTheme = TextTheme(
  titleSmall: titleSmall,
  titleMedium: titleMedium,
  titleLarge: titleLarge,
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
  bodySmall: bodySmall,
  bodyMedium: bodyMedium,
  bodyLarge: bodyLarge,
  labelSmall: labelSmall,
  labelMedium: labelMedium,
  labelLarge: labelLarge,
  displaySmall: displaySmall,
  displayMedium: displayMedium,
  displayLarge: displayLarge,
);
