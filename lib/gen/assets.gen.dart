/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Alert.svg
  SvgGenImage get alert => const SvgGenImage('assets/icons/Alert.svg');

  /// File path: assets/icons/Arrow.svg
  SvgGenImage get arrow => const SvgGenImage('assets/icons/Arrow.svg');

  /// File path: assets/icons/ArrowLeft.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/icons/ArrowLeft.svg');

  /// File path: assets/icons/EyeOff.svg
  SvgGenImage get eyeOff => const SvgGenImage('assets/icons/EyeOff.svg');

  /// File path: assets/icons/EyeOn.svg
  SvgGenImage get eyeOn => const SvgGenImage('assets/icons/EyeOn.svg');

  /// File path: assets/icons/Failure.svg
  SvgGenImage get failure => const SvgGenImage('assets/icons/Failure.svg');

  /// File path: assets/icons/Filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/Filter.svg');

  /// File path: assets/icons/HEART.svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/HEART.svg');

  /// File path: assets/icons/Logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icons/Logo.svg');

  /// File path: assets/icons/PitonLogo.svg
  SvgGenImage get pitonLogo => const SvgGenImage('assets/icons/PitonLogo.svg');

  /// File path: assets/icons/PitonLogoWhite.svg
  SvgGenImage get pitonLogoWhite =>
      const SvgGenImage('assets/icons/PitonLogoWhite.svg');

  /// File path: assets/icons/Search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/Search.svg');

  /// File path: assets/icons/Success.svg
  SvgGenImage get success => const SvgGenImage('assets/icons/Success.svg');

  /// File path: assets/icons/arrow_down.svg
  SvgGenImage get arrowDown => const SvgGenImage('assets/icons/arrow_down.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        alert,
        arrow,
        arrowLeft,
        eyeOff,
        eyeOn,
        failure,
        filter,
        heart,
        logo,
        pitonLogo,
        pitonLogoWhite,
        search,
        success,
        arrowDown
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/IconBg.png
  AssetGenImage get iconBg => const AssetGenImage('assets/images/IconBg.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconBg];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/en-US.json
  String get enUS => 'assets/lang/en-US.json';

  /// File path: assets/lang/tr-TR.json
  String get trTR => 'assets/lang/tr-TR.json';

  /// List of all assets
  List<String> get values => [enUS, trTR];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
