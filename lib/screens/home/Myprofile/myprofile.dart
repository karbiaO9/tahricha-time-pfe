import 'package:flutter/material.dart';
import 'package:tahricha_app/palatte.dart';

import 'package:tahricha_app/sizes.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(249, 50, 9, .2),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('EditProfile');
                },
                icon: Icon(Icons.mode_edit_outline_rounded))
          ],
          centerTitle: true,
          title: Text(
            'My Profile',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
          child: Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/eni.png'),
                  minRadius: Sizes.RADIUS_60,
                  maxRadius: Sizes.RADIUS_60,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Karbia Oussema',
                  style: kBodyTextP,
                ),
                Flexible(
                    child: ListView.builder(
                        itemExtent: 420,
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 233,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white70),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Image.asset(
                                            'assets/images/kunafa.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              285, 15, 20, 0),
                                          child: Container(
                                            height: 20,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.thumb_up,
                                                        size: 10,
                                                        color:
                                                            Colors.amber[900],
                                                      ),
                                                      Text(
                                                        'Good',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kBodyText8,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Container(
                                    height: 170,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white70),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.thumb_up),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            Text(
                                              '10',
                                              style: kBodyText001,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.thumb_down),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            Text(
                                              '4',
                                              style: kBodyText001,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.comment),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.favorite_outline),
                                                color: Colors.red),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.report_gmailerrorred),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                          ]),
                                          Text(
                                            'Food : Turkish baklewa',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Location: Sahloul,Sousse',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Price: 13dt',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Restaurant: Dar Alkunafa',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }

                          if (index == 1) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 233,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white70),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Image.asset(
                                            'assets/images/pasta.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              285, 15, 20, 0),
                                          child: Container(
                                            height: 20,
                                            width: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.thumb_up,
                                                        size: 10,
                                                        color:
                                                            Colors.amber[900],
                                                      ),
                                                      Text(
                                                        'Good',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kBodyText8,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Container(
                                    height: 170,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white70),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.thumb_up),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            Text(
                                              '21',
                                              style: kBodyText001,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.thumb_down),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            Text(
                                              '2',
                                              style: kBodyText001,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.comment),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.favorite_outline),
                                                color: Colors.red),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                    Icons.report_gmailerrorred),
                                                color: Color.fromRGBO(
                                                    62, 62, 104, 100)),
                                          ]),
                                          Text(
                                            'Food : Spaghetti Sauce Blanche',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Location: Monastir',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Price: 16dt',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            'Restaurant: Bizz\'ar',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        })),
              ],
            ),
          ]),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueGrey, width: 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0))),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text('Home'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.red,
                      ),
                      Text('Favourite'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        heightFactor: 0,
                        child: Icon(
                          Icons.add_circle_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 75.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.notifications,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text('Notifications'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'MyProfile'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text('Profile'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
