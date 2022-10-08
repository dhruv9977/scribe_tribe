import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/colors.dart';
import '../../../components/constants/size_config.dart';
// ignore_for_file: prefer_const_constructors

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  final double coverHeight = 220;
  final double profileHeight = 124;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          buildTop(),
          buildSizeHeight(height: 170),
          DefaultTabController(
              length: 2,
              child: SafeArea(
                child: SizedBox(
                  height: SizeConfig.screenHeight,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              'Personal Details',
                              style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Exam Details',
                              style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 30),
                              child: Column(
                                children: [
                                  row(
                                    text1: 'Age         ',
                                    text2: '19 years',
                                  ),
                                  row(
                                    text1: 'Requires ',
                                    text2: 'Gujarati',
                                  ),
                                  row(
                                    text1: 'Commute',
                                    text2: 'Provide',
                                  ),
                                  buildSizeHeight(height: 55),
                                  Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(20)),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.check),
                                        ),
                                        buildSizeWidth(width: 96),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                            shape: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(20)),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  row(
                                    text1: 'Date',
                                    text2: '30-10-2022',
                                  ),
                                  row(
                                    text1: 'Time',
                                    text2: '9:00 AM',
                                  ),
                                  row(
                                    text1: 'Duration',
                                    text2: '03 hours',
                                  ),
                                  row(
                                    text1: 'Location',
                                    text2: 'Bopal Ahmedabad',
                                  ),
                                  row(
                                    text1: 'Exam Name',
                                    text2: 'SSC',
                                  ),
                                  row(
                                    text1: 'Subject',
                                    text2: 'Hindi',
                                  ),
                                  row(
                                    text1: 'Language',
                                    text2: 'Hindi',
                                  ),
                                  buildSizeHeight(height: 55),
                                  Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green),
                                            shape: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(20)),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.check),
                                        ),
                                        buildSizeWidth(width: 96),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                            shape: MaterialStateProperty
                                                .resolveWith(
                                                    (states) => CircleBorder()),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(20)),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
            top: top,
            child: Column(
              children: [
                buildProfileImage(),
                Container(
                    width: getProportionateScreenWidth(206.96),
                    color: AppColors.kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                          child: Text(
                        'Pranav Sheth',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
              ],
            )),
      ],
    );
  }

  Widget buildCoverImage() => Container(
      color: AppColors.kPrimaryColor,
      child: Container(
        width: double.infinity,
        height: coverHeight,
      ));

  Widget buildProfileImage() => Container(
        width: getProportionateScreenWidth(166.96),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Image.asset('assets/icons/avatar.png'),
      );
}

class row extends StatelessWidget {
  const row({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                text1,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text2,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
