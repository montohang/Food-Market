part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

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
  }

  @override
  Widget build(BuildContext context) {
    return (picturePath == null)
        ? loadingIndicator
        : Stack(
            children: [
              ListView(
                children: [
                  Column(
                    children: [
                      //// Header
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          height: 220,
                          margin: EdgeInsets.only(bottom: defaultMargin),
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/photo_border.png'))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(picturePath),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Text(
                                name,
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                email,
                                style: greyFontSytle.copyWith(
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )),
                      //// Body
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            CustomTabBar(
                              titles: ["Account", "FoodMarket"],
                              selectedIndex: selectedIndex,
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              children: ((selectedIndex == 0)
                                      ? [
                                          'Edit Profile',
                                          'Home Address',
                                          'Security',
                                          'Payment'
                                        ]
                                      : [
                                          'Rate App',
                                          'Help Center',
                                          'Privacy & Policy',
                                          'Term & Condition'
                                        ])
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 16,
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e,
                                              style: blackFontSytle3,
                                            ),
                                            SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: Image.asset(
                                                'assets/right_arrow.png',
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    padding: const EdgeInsets.all(8.0),
                    icon: FaIcon(FontAwesomeIcons.cog),
                    iconSize: 14.0,
                    color: greyColor,
                    onPressed: () {
                      Get.to(SettingPage());
                    }),
              ),
            ],
          );
  }
}
