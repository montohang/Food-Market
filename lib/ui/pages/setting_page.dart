part of 'pages.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Map<String, bool> itemSetting = {
    'Edit Profile': false,
    'Home Address': false,
    'Security': false,
    'Payment': false,
    'Rate App': false,
    'Help Center': false,
    'Privacy & Policy': false,
    'Term & Condition': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: 'Setting',
        subtitle: 'Set your environment',
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                  children: itemSetting.keys
                      .map(
                        (String key) => Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: CheckboxListTile(
                            title: Text(
                              key,
                              style: blackFontSytle3,
                            ),
                            value: itemSetting[key],
                            onChanged: (bool value) {
                              setState(() {
                                itemSetting[key] = value;
                              });
                            },
                          ),
                        ),
                      )
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
