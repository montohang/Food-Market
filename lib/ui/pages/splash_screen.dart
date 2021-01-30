part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String auth;

  Future<String> getPref(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  getAuth() async {
    auth = await getPref("auth");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAuth();
    Timer(Duration(seconds: 3), () {
      // if (auth == null) {
      Get.off(SignInPage());
      // } else {
      //   Get.off(MainPage());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo.png'))),
          ),
        ));
  }
}
