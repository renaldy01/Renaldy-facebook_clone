import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
    this.userId,
  });

  final String? userId;

  static const routeName = '/profile';

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.realWhiteColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    width: 50,
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  )
                ],
              ),
            ),
            Container(
              //color: Colors.white,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              height: 1025,
              child: Column(
                children: [
                  Row(
                    children: [

                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(12),
                      child: MaterialButton(
                        color: AppColors.darkGreyColor,
                        onPressed: () {},
                        child: Text("See More"),
                        minWidth: double.infinity,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Text("Help & Support"),
                    leading: Icon(Icons.help),
                    trailing: Icon(Icons.arrow_drop_down),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text("Settings & Privacy"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_drop_down),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: MaterialButton(
                          color: AppColors.darkGreyColor,
                          onPressed: () {},
                          child: Text("Log Out"),
                          minWidth: double.infinity,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
