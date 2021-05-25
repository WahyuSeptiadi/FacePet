import 'package:face_pet/models/pets.dart';
import 'package:face_pet/pages/detail_page.dart';
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
            return HomeMobilePage();
          } else if (constraints.maxWidth <= 1200) {
            return HomeWebPage(gridCount: 4);
          } else {
            return HomeWebPage(gridCount: 6);
          }
        },
      ),
    );
  }
}

class HomeWebPage extends StatelessWidget {
  final int gridCount;

  HomeWebPage({this.gridCount});

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
          children: allPetsList.map((pets) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(pets: pets);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        pets.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        pets.name,
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
                        pets.type,
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

class HomeMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ShadowText(
          '> Trending Pets',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'louis',
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: trendPetsList.length,
            itemBuilder: (BuildContext context, int index) {
              final Pets trend = trendPetsList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(pets: trend);
                  }));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(trend.imageAsset),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        trend.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'louis',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        trend.type,
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
          '> All Pets',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'louis',
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: Scrollbar(
            isAlwaysShown: true,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: allPetsList.map((pets) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(pets: pets);
                      }));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              pets.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              pets.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              pets.type,
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
          ),
        ),
      ],
    );
  }
}
