import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Colors
  static const Color bgBlue = Color(0xFFC2E6F3);
  static const Color nearlyBlue = Color(0xFF0A9EDD);
  static const Color lightBlue = Color(0xFF90E0EF);
  static const Color nearlyYellow = Color(0xFFFFC400);
  static const Color nearlyBlack = Color(0xFF1c1d1f);
  static const Color notWhite = Color(0xFFE8F4F5);
  static const Color nearlyWhite = Color(0xFFFDFEFF);
  static const Color bgRed = Color(0xFFFC6C85);

  static const Color success = Color(0xFF4cb34c);
  static const Color warning = Color(0xFFFF0000);

  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkGrey = Color(0xFF26293a);

  static const Color darkText = Color(0xFF2B2B2B);
  static const Color darkerText = Color(0xFF171717);
  static const Color lightText = Color(0xFF687980);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const Color darkBlue = Color(0xFF26293a);
  static const Color nearlyGreen = Color(0xFF4cb34c);
  static const Color nearlyRed = Color(0xFFFF0000);
  static const Color secondary = Color(0xFF5ce1e6);

  static const primaryColor = Color(0xFF2697FF);
  static const secondaryColor = nearlyWhite;
  static const bgColor = Color(0xFFF9F9F9);
  static const Color nearlyGrey = Color.fromARGB(255, 182, 183, 184);

  // gradients
  static const Color gradient1 = Color(0xFFA0B5EB);
  static const Color gradient2 = Color(0xFFC9F0E4);

  // Typography
  static TextStyle heading = const TextStyle(
      fontSize: 20,
      letterSpacing: .27,
      fontWeight: FontWeight.w600,
      color: AppTheme.darkGrey);

  static TextStyle paragraph = const TextStyle(
    fontSize: 15,
    letterSpacing: .27,
    fontWeight: FontWeight.w500,
    color: lightText,
  );

  static TextStyle bottomInfo = const TextStyle(
    color: Color(0xffA6B0BD),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle selectOptionText = const TextStyle(
      fontSize: 16, letterSpacing: .22, color: AppTheme.lightText);

  static TextStyle btnText = const TextStyle(
      letterSpacing: 0.75,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Colors.white);

  static TextStyle btnTextSecondary = const TextStyle(
      letterSpacing: 1.725,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: nearlyBlack);

  static TextStyle introHeading = const TextStyle(
      fontSize: 28,
      letterSpacing: .15,
      fontWeight: FontWeight.w600,
      color: AppTheme.darkGrey);

  static TextStyle introParagraph = const TextStyle(
      fontSize: 18,
      letterSpacing: .15,
      fontWeight: FontWeight.w400,
      color: AppTheme.lightText);

  static TextStyle title = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static TextStyle subtitle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static TextStyle infoText = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle accountTileTxt = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppTheme.grey,
  );

  static TextStyle numText =
      const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600);

  static TextStyle bigNumText =
      const TextStyle(fontSize: 18.5, fontWeight: FontWeight.w600);

  static TextStyle body2 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static TextStyle subHeading = const TextStyle(
      fontSize: 16,
      letterSpacing: .15,
      fontWeight: FontWeight.w600,
      color: AppTheme.darkGrey);

  static TextStyle body1 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: lightText,
  );

  static TextStyle caption = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static TextStyle body3 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static TextStyle tagTxt = const TextStyle(
      letterSpacing: .5,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: Colors.white);

  //Padding
  static double defaultPadding = 16;
  static Padding horizontalPadding =
      Padding(padding: EdgeInsets.symmetric(horizontal: defaultPadding));
  static Padding verticalPadding =
      Padding(padding: EdgeInsets.symmetric(vertical: defaultPadding / 2));
  static Padding standard = Padding(padding: EdgeInsets.all(defaultPadding));

  // Widget Decorations
  static Widget btnLoading = const SizedBox(
    width: 24,
    height: 24,
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 3.5,
        color: AppTheme.nearlyBlue,
        backgroundColor: AppTheme.nearlyWhite,
      ),
    ),
  );

  static TextStyle btnTextCard = const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white);

  static TextStyle mainHeader = const TextStyle(
    fontFamily: 'Hindya',
    fontSize: 60,
    color: Colors.black,
  );

  static ButtonStyle btnStyleCard = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: AppTheme.nearlyBlack,
    shadowColor: AppTheme.darkGrey.withOpacity(1),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  static ButtonStyle btnAlertStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: AppTheme.nearlyBlack,
    shadowColor: AppTheme.darkGrey.withOpacity(0.5),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
  );

  static ButtonStyle btnLogOutStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    backgroundColor: AppTheme.warning.withOpacity(.8),
    shadowColor: AppTheme.darkGrey.withOpacity(0.5),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
  );

  static ButtonStyle btnStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    backgroundColor: AppTheme.nearlyBlack,
    shadowColor: AppTheme.darkGrey.withOpacity(0.5),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
  );

  static ButtonStyle btnStyleSecondary = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: AppTheme.nearlyBlack,
        )),
    backgroundColor: AppTheme.nearlyWhite,
    shadowColor: AppTheme.darkGrey.withOpacity(0.5),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
  );

  static ButtonStyle btnStyleForWeb = ElevatedButton.styleFrom(
    fixedSize: Size(
      250,
      50,
    ),
    backgroundColor: AppTheme.nearlyBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    shadowColor: AppTheme.darkGrey.withOpacity(0.5),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
  );

  static BoxDecoration boxShadow = BoxDecoration(
      color: AppTheme.nearlyWhite,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: AppTheme.grey.withOpacity(0.2),
          blurRadius: 16,
        ),
      ],
      borderRadius: BorderRadius.circular(16));

  static BoxDecoration boxShadowNoBorder = BoxDecoration(
    color: AppTheme.nearlyWhite,
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: AppTheme.grey.withOpacity(0.2),
        blurRadius: 16,
      ),
    ],
  );
  static BoxDecoration inputContainer = const BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(16),
    ),
    boxShadow: [
      BoxShadow(
        color: AppTheme.chipBackground,
        blurRadius: 8,
        spreadRadius: 2,
      ),
    ],
  );
}
