
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsHelper {
  
  static String get adUnitID{
    return "ca-app-pub-7643149659473872/5926783671";
  }
  static InterstitialAdLoadCallback adLoadCallback(){
    return InterstitialAdLoadCallback(
      onAdLoaded: (ad)async{
        await ad.show();
      }, onAdFailedToLoad: (LoadAdError error) { 
        print(error);
       }
    );
  }
}
