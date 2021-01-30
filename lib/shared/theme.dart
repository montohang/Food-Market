part of 'shared.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();

TextStyle greyFontSytle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontSytle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontSytle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontSytle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
