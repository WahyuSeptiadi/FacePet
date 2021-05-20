import 'package:face_pet/utils/shadow_text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              width: 40,
              height: 40,
              child: ClipRRect(
                child: Image.asset('images/logo.jpg'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: ShadowText(
                'My Profile',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Old',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
