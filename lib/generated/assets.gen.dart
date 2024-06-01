/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/gif
  $AssetsIconsGifGen get gif => const $AssetsIconsGifGen();

  /// Directory path: assets/icons/png
  $AssetsIconsPngGen get png => const $AssetsIconsPngGen();

  /// Directory path: assets/icons/svg
  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/jpg
  $AssetsImagesJpgGen get jpg => const $AssetsImagesJpgGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/ar.json
  String get ar => 'assets/locales/ar.json';

  /// File path: assets/locales/en.json
  String get en => 'assets/locales/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class $AssetsIconsGifGen {
  const $AssetsIconsGifGen();

  /// File path: assets/icons/gif/ic_loader.gif
  AssetGenImage get icLoader =>
      const AssetGenImage('assets/icons/gif/ic_loader.gif');

  /// List of all assets
  List<AssetGenImage> get values => [icLoader];
}

class $AssetsIconsPngGen {
  const $AssetsIconsPngGen();

  /// File path: assets/icons/png/ic_app_launcher.png
  AssetGenImage get icAppLauncher =>
      const AssetGenImage('assets/icons/png/ic_app_launcher.png');

  /// File path: assets/icons/png/iv_profile.png
  AssetGenImage get ivProfile =>
      const AssetGenImage('assets/icons/png/iv_profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [icAppLauncher, ivProfile];
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/ic_checkbox_internet.svg
  SvgGenImage get icCheckboxInternet =>
      const SvgGenImage('assets/icons/svg/ic_checkbox_internet.svg');

  /// File path: assets/icons/svg/ic_close_expantion.svg
  SvgGenImage get icCloseExpantion =>
      const SvgGenImage('assets/icons/svg/ic_close_expantion.svg');

  /// File path: assets/icons/svg/ic_no_connection.svg
  SvgGenImage get icNoConnection =>
      const SvgGenImage('assets/icons/svg/ic_no_connection.svg');

  /// File path: assets/icons/svg/ic_open_expantion.svg
  SvgGenImage get icOpenExpantion =>
      const SvgGenImage('assets/icons/svg/ic_open_expantion.svg');

  /// File path: assets/icons/svg/ic_swipe_down_arrow.svg
  SvgGenImage get icSwipeDownArrow =>
      const SvgGenImage('assets/icons/svg/ic_swipe_down_arrow.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icCheckboxInternet,
        icCloseExpantion,
        icNoConnection,
        icOpenExpantion,
        icSwipeDownArrow
      ];
}

class $AssetsImagesJpgGen {
  const $AssetsImagesJpgGen();

  /// File path: assets/images/jpg/iv_mat_imgurl.jpeg
  AssetGenImage get ivMatImgurl =>
      const AssetGenImage('assets/images/jpg/iv_mat_imgurl.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [ivMatImgurl];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/iv_blur_light.png
  AssetGenImage get ivBlurLight =>
      const AssetGenImage('assets/images/png/iv_blur_light.png');

  /// List of all assets
  List<AssetGenImage> get values => [ivBlurLight];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/iv_logo.svg
  SvgGenImage get ivLogo => const SvgGenImage('assets/images/svg/iv_logo.svg');

  /// File path: assets/images/svg/iv_splash_dark.svg
  SvgGenImage get ivSplashDark =>
      const SvgGenImage('assets/images/svg/iv_splash_dark.svg');

  /// File path: assets/images/svg/iv_splash_light.svg
  SvgGenImage get ivSplashLight =>
      const SvgGenImage('assets/images/svg/iv_splash_light.svg');

  /// List of all assets
  List<SvgGenImage> get values => [ivLogo, ivSplashDark, ivSplashLight];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

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
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
