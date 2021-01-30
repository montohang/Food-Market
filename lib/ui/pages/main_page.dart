part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  MainPage({this.initialPage = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime currentBackPressTime;
  int selectedPage = 0;
  PageController pageController;

  String name;
  String picturePath;
  String email;

  Future<String> getPref(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  getMyProfile() async {
    name = await getPref("name");
    email = await getPref("email");
    picturePath = await getPref("picture_path");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyProfile();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return (picturePath == null)
        ? loadingIndicator
        : WillPopScope(
            onWillPop: onWillPop,
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  SafeArea(
                      child: Container(
                    color: 'FAFAFC'.toColor(),
                  )),
                  SafeArea(
                      child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedPage = index;
                      });
                    },
                    children: [
                      Center(
                        child: FoodPage(),
                      ),
                      Center(child: OrderHistoryPage()),
                      Center(
                        child: ProfilePage(),
                      ),
                    ],
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomBottomNavBar(
                      selectedIndex: selectedPage,
                      onTap: (index) {
                        setState(() {
                          selectedPage = index;
                        });
                        pageController.jumpToPage(selectedPage);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }

  // back button press
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar("", "",
          backgroundColor: "D9435E".toColor(),
          icon: Icon(
            MdiIcons.closeCircleOutline,
            color: Colors.white,
          ),
          titleText: Text(
            "tekan sekali lagi untuk keluar",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          messageText:
              Text("woi", style: GoogleFonts.poppins(color: Colors.white)));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
