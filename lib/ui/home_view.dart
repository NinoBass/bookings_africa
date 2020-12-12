import 'package:bookings_africa/constants.dart';
import 'package:bookings_africa/models/user_card.dart';
import 'package:bookings_africa/models/user_info.dart';
import 'package:bookings_africa/service/api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<UserInfo>> futureUserInfo;

  @override
  void initState() {
    super.initState();
    futureUserInfo = getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            header(),
            SizedBox(
              height: 12,
            ),
            searchBox(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              // color: Colors.green,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '48 RESULTS',
                    style: TextStyle(
                        letterSpacing: 0.7,
                        color: ksecondaryColor.withOpacity(1.0),
                        fontFamily: 'HelveticaM',
                        fontStyle: FontStyle.normal,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 4.0,
                    width: 4.0,
                    decoration: BoxDecoration(
                      color: ksecondaryColor.withOpacity(1.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: kprimaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TOP RATED',
                          style: TextStyle(
                              letterSpacing: 0.7,
                              color: kprimaryColor.withOpacity(1.0),
                              fontFamily: 'HelveticaB',
                              fontStyle: FontStyle.normal,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w900),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 16,
                          color: Colors.orangeAccent,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'ADVANCED FILTER',
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black,
                        fontFamily: 'HelveticaM',
                        fontStyle: FontStyle.normal,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: futureUserInfo,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      var data = snapshot.data;
                      return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data == null ? 0 : data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return UserCard(
                                id: data[index].id,
                                email: data[index].email,
                                firstName: data[index].firstName,
                                lastName: data[index].lastName,
                                avatar: data[index].avatar,
                                imagePath: imagePath[index],
                              );
                            },
                            shrinkWrap: true,
                          ));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget header() {
  return Container(
    margin: EdgeInsets.only(right: 16, left: 24, top: 25),
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset("assets/image 3.png"),

        // Image.asset("assets/menu.png"),
        IconButton(
          onPressed: () {},
          tooltip: 'Menu',
          icon: Icon(Icons.menu),
          iconSize: 35,
        )
      ],
    ),
  );
}

Widget searchBox() {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 24,
    ),
    // height: 50,
    padding: EdgeInsets.symmetric(
      horizontal: 25,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: ksecondaryColor.withOpacity(0.8),
      ),
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5.0),
        border: InputBorder.none,
        icon: SvgPicture.asset(
          searchIcon,
          color: ksecondaryColor.withOpacity(1.0),
        ),
        hintText: "Cinematographer",
        hintStyle: TextStyle(
          color: ksecondaryColor.withOpacity(1.0),
          fontFamily: 'Helvetica',
          fontStyle: FontStyle.normal,
        ),
      ),
    ),
  );
}
