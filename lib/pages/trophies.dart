import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:Encasillado/common/imagepaths.dart';
import 'package:Encasillado/common/miscellaneous.dart';
import 'package:Encasillado/common/widgets.dart';
import 'package:Encasillado/common/colors.dart';
import 'package:Encasillado/ad_helper.dart';

class Trophies extends StatefulWidget {
  @override
  _TrophiesState createState() => _TrophiesState();
}

class _TrophiesState extends State<Trophies> {

  // ADMOB MANAGEMENT
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  void initState() {

    if (showAds) {
      _initGoogleMobileAds();
      _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isBannerAdReady = true;
            });
          },
          onAdFailedToLoad: (ad, err) {
            print('Failed to load a banner ad: ${err.message}');
            _isBannerAdReady = false;
            ad.dispose();
          },
        ),
      );

      _bannerAd.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    String allTag = allTagImgLightmode;
    String infiniteTag = infiniteTagImgLightmode;
    String wotdTag = wotdTagImgLightmode;

    if (darkMode){
      allTag = allTagImgDarkmode;
      infiniteTag = infiniteTagImgDarkmode;
      wotdTag = wotdTagImgDarkmode;
    } else {
      allTag = allTagImgLightmode;
      infiniteTag = infiniteTagImgLightmode;
      wotdTag = wotdTagImgLightmode;
    }


    return Scaffold(
        appBar: myAppBarWithoutButtonsWithBackArrow(context),
        backgroundColor: appWhite,
        body: Container(
          margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Expanded(child: ListView(
                addAutomaticKeepAlives: true,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tus trofeos",
                    style: TextStyle(
                      fontSize: 25,
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                        decoration: BoxDecoration(
                          color: keyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "$diamondTrophies  ",
                              style: TextStyle(
                                fontSize: 20,
                                color: appBlack,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'RaleWay',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(diamondTrophy, scale: 17.5,),
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                        decoration: BoxDecoration(
                          color: keyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "$goldTrophies  ",
                              style: TextStyle(
                                fontSize: 20,
                                color: appBlack,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'RaleWay',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(goldTrophy, scale: 17.5,),
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                        decoration: BoxDecoration(
                          color: keyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "$silverTrophies  ",
                              style: TextStyle(
                                fontSize: 20,
                                color: appBlack,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'RaleWay',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(silverTrophy, scale: 17.5,),
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                        decoration: BoxDecoration(
                          color: keyColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "$bronzeTrophies  ",
                              style: TextStyle(
                                fontSize: 20,
                                color: appBlack,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'RaleWay',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(bronzeTrophy, scale: 17.5,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  // DIAMOND
                  Text(
                    "Diamante",
                    style: TextStyle(
                      fontSize: 20,
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trophiesRow('Todos los trofeos', 'Progreso: $totalTrophies de 12', diamondTrophy, allTrophiesTr),

                  SizedBox(height: 15,),
                  // GOLD
                  Text(
                    "Oro",
                    style: TextStyle(
                      fontSize: 20,
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trophiesRowAdvanced(allTag, 'Acierta a la primera', 'Progreso: 0%', goldTrophy, atFirstTr),
                  trophiesRowAdvanced(infiniteTag, '25.000 puntos', 'Mejor: $scoreRecord', goldTrophy, points25kTr),
                  trophiesRowAdvanced(infiniteTag, 'Racha de 25', 'Mejor: $streakRecord', goldTrophy, streak25Tr),
                  trophiesRowAdvanced(wotdTag, 'Juega 30 días seguidos', 'Actual: $consecutiveDaysWotd', goldTrophy, days30wotdTr),

                  SizedBox(height: 15,),
                  // SILVER
                  Text(
                    "Plata",
                    style: TextStyle(
                      fontSize: 20,
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trophiesRowAdvanced(allTag, 'Acierta en 2 intentos', 'Progreso: 0%', silverTrophy, atSecondTr),
                  trophiesRowAdvanced(infiniteTag, '10.000 puntos', 'Mejor: $scoreRecord', silverTrophy, points10kTr),
                  trophiesRowAdvanced(infiniteTag, 'Racha de 10', 'Mejor: $streakRecord', silverTrophy, streak10Tr),
                  trophiesRowAdvanced(wotdTag, 'Juega 15 días seguidos', 'Actual: $consecutiveDaysWotd', silverTrophy, days15wotdTr),

                  SizedBox(height: 15,),
                  // BRONZE
                  Text(
                    "Bronce",
                    style: TextStyle(
                      fontSize: 20,
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trophiesRowAdvanced(allTag, 'Tu primera partida', 'Progreso: 0%', bronzeTrophy, firstPlayTr),
                  trophiesRowAdvanced(infiniteTag, '5.000 puntos', 'Mejor: $scoreRecord', bronzeTrophy, points5kTr),
                  trophiesRowAdvanced(infiniteTag, 'Racha de 5', 'Mejor: $streakRecord', bronzeTrophy, streak5Tr),
                  trophiesRowAdvanced(wotdTag, 'Juega 7 días seguidos', 'Actual: $consecutiveDaysWotd', bronzeTrophy, days7wotdTr),

                  SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(allTagImgGrey, scale: 15),
                    smallText(' Todos los modos de juego.'),
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(infiniteTagImgGrey, scale: 15),
                      smallText(' Solo en Palabras Infinitas.'),
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(wotdTagImgGrey, scale: 15),
                      smallText(' Solo en La Palabra del Día.'),
                    ],),

                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "\nGracias por jugar a Encasillado v$appVersion",
                    style: TextStyle(
                      fontSize: 12,
                      color: appGrey,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                ],
              ),),
              //if (_isBannerAdReady) SizedBox(height: 5,),
              //if (_isBannerAdReady) smallText('ADVERTISING'),
              if (_isBannerAdReady) Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),
            ],
          ),



        )
    );
  }
}