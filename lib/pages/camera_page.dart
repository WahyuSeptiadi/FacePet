import 'package:face_pet/utils/shadow_text.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
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
                'Upload Photo',
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
