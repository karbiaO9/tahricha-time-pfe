import 'package:flutter/material.dart';
import 'package:tahricha_app/home_widgets/find/findRest.dart';
import 'package:tahricha_app/palatte.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(220),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Trending Restaurants',
          textAlign: TextAlign.center,
          style: kBodyText3,
        ),
        backgroundColor: Colors.red[600],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FindR(
                      hint: 'Find Restaurants',
                      icon: Icons.search,
                      inputAction: TextInputAction.search,
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
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
                                        borderRadius: const BorderRadius.only(
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Open',
                                              textAlign: TextAlign.center,
                                              style: kBodyText8,
                                            ),
                                          ),
                                        )),
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
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.star_outlined,
                                                  size: 15,
                                                  color: Colors.amber[900],
                                                ),
                                                const Text(
                                                  '4,5',
                                                  textAlign: TextAlign.center,
                                                  style: kBodyText8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Container(
                                  height: 75,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Colors.white70),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dar Alkunafa',
                                          style: kBodyText1,
                                          textAlign: TextAlign.justify,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        if (index == 1) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 233,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white70),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      child: Image.asset(
                                        'assets/images/dessert.jpg',
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 75,
                                    width: 350,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white70),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dar Alkunafa',
                                            style: kBodyText1,
                                            textAlign: TextAlign.justify,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red.withRed(240),
                                  border:
                                      Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('HomePage');
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      'add',
                                      style: kBodyText1,
                                    ),
                                  ))),
                        );
                      })),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const Text('Home'),
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
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      heightFactor: 0,
                      child: Icon(
                        Icons.add_circle_rounded,
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
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const Text('Notifications'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person_outline_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const Text('Profile'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
