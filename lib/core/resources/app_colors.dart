import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const deepOrange = Color(0xFFD54F23);
  static const Color primaryColor2 = Color(0xFFFFA549);
  static const Color blueDarkColor = Color(0xFF1c1b43);
  static const Color blue = Color(0xFF2563EB);
  static const Color blueText = Color(0xFF1E68D7);
  static const Color blueText2 = Color(0xFF050826);
  static const Color blueBackground= Color(0xFFceddf2);
  static const Color blueClose = Color(0xFF5B839F);
  static const Color blueIcon= Color(0xFF161455);
  static const Color greyIcon= Color(0xFFABABAB);
  static const Color greySearch= Color(0xFFD9D9D9);

  /// General colors
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color shadowColor = Color(0xFFB4BCC9);
  static const Color shadowColor2 = Color(0xFF194377);
  static const Color shadowColor3 = Color(0xFF00A76D);
  static const Color iconColor = Color(0xFF6090D8);
  static const Color iconArrow = Color(0xFF667085);
  static const Color bottomSheetColor = Color(0xFFD6DEE9);

  static const Color statusGreen = Color(0xFF25CE9D);
  static const Color statusBlue = Color(0xFF1FADFF);
  static const Color statusGray= Color(0xFF787878);
  static const Color statusRed= Color(0xFFB81F44);

  static const Color white = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFF0971CD);
  static const Color textStyle = Color(0xFF64748B);
  static const Color textStyle2 = Color(0xFF848A9C);
  static const Color textSearchColor = Color(0xFF787878);
  static const Color textStyleHome = Color(0xFF1B1E28);

  // TextField
  static const Color enabledTextField = Color(0xFFE2E8F0);
  static const Color hintTextField = Color(0xFF828A89);
  // static const Color green = Color(0xFF00C088);
  static const Color pink = Color(0xFFFE5D5A);
  static const Color orange = Color(0xFFF3DA91);
  //card
  static const Color card = Color(0xFF21589D);

//Splash
  static const Color circleSmell=Color(0xffDBE7FF) ;
  static const Color circleBig=Color(0xffE5EEFF) ;
  // static const Color orange = Color(0xFFFA995D);
  static const Color black = Color(0xFF000000);
  static const Color purple = Color(0xFF4A2E77);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyHeader = Color(0xFFCCDAF0);
  static const Color greyShade = Color(0xFF7a7a7a);
  static const Color greyShade350 = Color(0xFFD6D6D6);
  static const Color green = Color(0xFF4CAF50);

  static const Color accentColor = Color(0xFFFF8763);
  static const Color accentCard = Color(0xFFf4f7ff);
///slider

  static const Color slider = Color(0xFF0243EC);
  static const Color sliderInactive = Color(0xFFE6EAF5);
///chart
  static const Color chartBar = Color(0xFF008FFB);
  static const Color chartBar2 = Color(0xFF00A76D);
  static const Color chartBar3= Color(0xFFFFA84A);
  /// light theme colors
  static const Color mainLight = Color(0xFFF1F5F8);
  static const Color secondLight = Color(0xFFD15E59);

  // static const Color secondOpacity = Color(0xFFf3d5d4);
  static const Color iconFloatingActionButton = Color(0xFFFFF8F9);
  static const Color buttonLight = Color(0xFFECF5FF);
  static const Color thirdLight = Color(0xFFECF5FF);

  /// dark theme colors
  static const Color mainDark = Color(0xFF2A3457);
  static const Color secondDark = Color(0xFF313D67);
  static const Color buttonDark = Color(0xFF174272);

  /// edit image
  static const Color gradiant1 = Color(0xFF0012B5);
  static const Color gradiant2 = Color(0xFF32B0F2);

// chat dialogl

  static const Color blackColor3 = Color(0xFF1C1C1E);

  static const Color acceptTextColor = Color(0xFF00C088);
  static const Color rejectTextColor = Color(0xFFEF262D);
  static const Color pendingTextColor = Color(0xFFFFBD23);

  ///chart color
  static const Color orangeColor = Color(0xFFdf6f2a);
  static const Color lightOrangeColor = Color(0xFFedc978);

  //card home color

  static const Color primary = Color(0xFFd4655e);
  static const Color pink2 = Color(0xFFFC7A5E);
  static const Color pink3 = Color(0xFFFF9A7F);
  static const Color pink4 = Color(0xFFFFC3AC);
  static const Color purple2 = Color(0xFF684E8D);
  static const Color purple3 = Color(0xFF9C5D80);

  static LinearGradient getDarkLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[500]!,
        color[400]!,
        color[300]!,
      ],
    );
  }

  static LinearGradient getButtonGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        color[500]!,
        color[400]!,
        color[300]!,
      ],
    );
  }

  static LinearGradient getLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[300]!,
        color[200]!,
        color[100]!,
      ],
      stops: const [
        0.4,
        0.7,
        0.9,
      ],
    );
  }
}
