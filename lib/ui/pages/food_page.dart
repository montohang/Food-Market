part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  String name;
  String picturePath;
  String email;

  Future<String> getPref(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  getMyFood() async {
    name = await getPref("name");
    email = await getPref("email");
    picturePath = await getPref("picture_path");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyFood();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return (picturePath == null)
        ? loadingIndicator
        : ListView(
            children: [
              Column(
                children: [
                  //// HEADER
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Food Market',
                              style: blackFontSytle1,
                            ),
                            Text(
                              "Let's get some foods",
                              style: greyFontSytle.copyWith(
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    picturePath,
                                  ),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  //// LIST OF FOOD
                  Container(
                    height: 258,
                    width: double.infinity,
                    child: BlocBuilder<FoodCubit, FoodState>(
                      builder: (_, state) => (state is FoodLoaded)
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: state.foods
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                                left: (e == state.foods.first)
                                                    ? defaultMargin
                                                    : 0,
                                                right: defaultMargin),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.to(FoodDetailsPage(
                                                      transaction: Transaction(
                                                        food: e,
                                                      ),
                                                      onBackButtonPressed: () {
                                                        Get.back();
                                                      }));
                                                },
                                                child: FoodCard(e)),
                                          ))
                                      .toList(),
                                )
                              ],
                            )
                          : Center(child: loadingIndicator),
                    ),
                  ),
                  //// LIST OF FOOD (TABS)
                  Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['New Taste', 'Popular', 'Recommended'],
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
                          BlocBuilder<FoodCubit, FoodState>(
                              builder: (_, state) {
                            if (state is FoodLoaded) {
                              List<Food> foods = state.foods
                                  .where((element) => element.types
                                      .contains((selectedIndex == 0)
                                          ? FoodType.new_food
                                          : (selectedIndex == 1)
                                              ? FoodType.popular
                                              : FoodType.recommended))
                                  .toList();

                              return Column(
                                children: foods
                                    .map((e) => Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              defaultMargin,
                                              0,
                                              defaultMargin,
                                              16),
                                          child: FoodListItem(
                                              food: e,
                                              itemWidth: listItemWidth),
                                        ))
                                    .toList(),
                              );
                            } else {
                              return Center(
                                child: loadingIndicator,
                              );
                            }
                          }),
                        ],
                      )),
                  SizedBox(
                    height: 80,
                  )
                ],
              )
            ],
          );
  }
}
