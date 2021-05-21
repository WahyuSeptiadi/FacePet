import 'package:face_pet/models/pets.dart';
import 'package:face_pet/pages/profile_page.dart';
import 'package:face_pet/utils/shadow_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'FacePets',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Old',
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'Coming Soon',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue[300],
                  textColor: Colors.white);
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return HorizontalList();
          } else if (constraints.maxWidth <= 1200) {
            return PetsGrid(gridCount: 4);
          } else {
            return PetsGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class PetsGrid extends StatelessWidget {
  final int gridCount;

  PetsGrid({this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          children: catPetsList.map((cat) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        cat.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        cat.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        cat.type,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ShadowText(
          '> Cats',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'louis',
            color: Colors.white,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: catPetsList.length,
            itemBuilder: (BuildContext context, int index) {
              final Pets cat = catPetsList[index];
              return InkWell(
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(cat.imageAsset),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        cat.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'louis',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        cat.type,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'louis',
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        ShadowText(
          '> Dogs',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'louis',
            color: Colors.white,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dogPetsList.length,
            itemBuilder: (BuildContext context, int index) {
              final Pets dog = dogPetsList[index];
              return InkWell(
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(dog.imageAsset),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        dog.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'louis',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        dog.type,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'louis',
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
