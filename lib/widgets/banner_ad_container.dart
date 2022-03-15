/*import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//ignore: must_be_immutable
class BannerAdContainer extends StatelessWidget {
  BannerAdContainer({Key? key, required this.width, required this.height}) : super(key: key);

  final double width;
  final double height;

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );



  @override
  Widget build(BuildContext context) {
    final BannerAd bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-5632099705427605/3204494360',
      size: AdSize(
        width: width.toInt(),
        height: height.toInt(),
      ),
      listener: listener,
      request: AdRequest(),
    );
    bannerAd.load();
    return Container(
      alignment: Alignment.center,
      child: AdWidget(
        ad: bannerAd,
      ),
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
    );
  }
}
*/