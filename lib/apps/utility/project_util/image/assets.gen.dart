/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/AmericanExpress.png
  AssetGenImage get americanExpress =>
      const AssetGenImage('assets/images/AmericanExpress.png');

  /// File path: assets/images/BackgroundImage.png
  AssetGenImage get backgroundImage =>
      const AssetGenImage('assets/images/BackgroundImage.png');

  /// File path: assets/images/BlackFridayPhoto.png
  AssetGenImage get blackFridayPhoto =>
      const AssetGenImage('assets/images/BlackFridayPhoto.png');

  /// File path: assets/images/HasNotification.png
  AssetGenImage get hasNotification =>
      const AssetGenImage('assets/images/HasNotification.png');

  /// File path: assets/images/SılaCerkez.png
  AssetGenImage get sLaCerkez =>
      const AssetGenImage('assets/images/SılaCerkez.png');

  /// File path: assets/images/Urun1.png
  AssetGenImage get urun1 => const AssetGenImage('assets/images/Urun1.png');

  /// File path: assets/images/Urun2.png
  AssetGenImage get urun2 => const AssetGenImage('assets/images/Urun2.png');

  /// File path: assets/images/Verve.png
  AssetGenImage get verve => const AssetGenImage('assets/images/Verve.png');

  /// File path: assets/images/Visa.png
  AssetGenImage get visa => const AssetGenImage('assets/images/Visa.png');

  /// File path: assets/images/added_to_cart.png
  AssetGenImage get addedToCart =>
      const AssetGenImage('assets/images/added_to_cart.png');

  /// File path: assets/images/checkbox-circle-line.png
  AssetGenImage get checkboxCircleLine =>
      const AssetGenImage('assets/images/checkbox-circle-line.png');

  /// File path: assets/images/cok_satanlar.png
  AssetGenImage get cokSatanlar =>
      const AssetGenImage('assets/images/cok_satanlar.png');

  /// File path: assets/images/fırsat_urunleri.png
  AssetGenImage get fRsatUrunleri =>
      const AssetGenImage('assets/images/fırsat_urunleri.png');

  /// File path: assets/images/indirim.png
  AssetGenImage get indirim => const AssetGenImage('assets/images/indirim.png');

  /// File path: assets/images/kategoriler.png
  AssetGenImage get kategoriler =>
      const AssetGenImage('assets/images/kategoriler.png');

  /// File path: assets/images/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/images/mastercard.png');

  /// File path: assets/images/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/notification.png');

  /// File path: assets/images/productPhoto.png
  AssetGenImage get productPhoto =>
      const AssetGenImage('assets/images/productPhoto.png');

  /// File path: assets/images/profilepp.png
  AssetGenImage get profilepp =>
      const AssetGenImage('assets/images/profilepp.png');

  /// File path: assets/images/sana_ozel.png
  AssetGenImage get sanaOzel =>
      const AssetGenImage('assets/images/sana_ozel.png');

  /// File path: assets/images/turkey.png
  AssetGenImage get turkey => const AssetGenImage('assets/images/turkey.png');

  /// File path: assets/images/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/images/wallet.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/search_background.png
  AssetGenImage get searchBackground =>
      const AssetGenImage('assets/images/searchBackground.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        americanExpress,
        backgroundImage,
        blackFridayPhoto,
        hasNotification,
        sLaCerkez,
        urun1,
        urun2,
        verve,
        visa,
        addedToCart,
        checkboxCircleLine,
        cokSatanlar,
        fRsatUrunleri,
        indirim,
        kategoriler,
        mastercard,
        notification,
        productPhoto,
        profilepp,
        sanaOzel,
        turkey,
        wallet,
        profile,
        searchBackground
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
