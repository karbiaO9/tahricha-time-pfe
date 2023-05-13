import 'package:flutter/material.dart';
import 'package:tahricha_app/home_widgets/categories/findcat.dart';

import 'package:tahricha_app/palatte.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(220),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.search))
        ],
        centerTitle: true,
        title: Text(
          'Categories',
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
                      itemCount: 7,
                      physics: NeverScrollableScrollPhysics(),
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
                                      height: 75,
                                      width: 325,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white70),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/images/pizza.jpg',
                                          fit: BoxFit.fitWidth,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 75,
                                      width: 325,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.orangeAccent
                                              .withAlpha(125)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Text(
                                          'Pizza',
                                          style: kBodyText02,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                    Stack(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white70),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'assets/images/dessert.jpg',
                                              fit: BoxFit.fitWidth,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.cyan.withAlpha(125)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Text(
                                              'Desserts',
                                              style: kBodyText02,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }
                        ;
                        if (index == 2) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white70),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'assets/images/pasta.jpg',
                                              fit: BoxFit.fitWidth,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blueAccent
                                                  .withAlpha(125)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Text(
                                              'Pasta',
                                              style: kBodyText02,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }
                        ;
                        if (index == 3) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white70),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'assets/images/tunisian.jpg',
                                              fit: BoxFit.fitWidth,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.yellow.withAlpha(100)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Text(
                                              'Tunisian',
                                              style: kBodyText02,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }
                        ;
                        if (index == 4) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white70),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'assets/images/Thot.jpg',
                                              fit: BoxFit.fitWidth,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.pink.withAlpha(75)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Text(
                                              'Hot',
                                              style: kBodyText02,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }
                        ;
                        if (index == 5) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white70),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              'assets/images/drinks.jpg',
                                              fit: BoxFit.fitWidth,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.indigo.withAlpha(125)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: Text(
                                              'Drinks',
                                              style: kBodyText02,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }

                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 325,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white70),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/food.jpg',
                                            fit: BoxFit.fitWidth,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 75,
                                        width: 325,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.red.withAlpha(125)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(
                                            'See all',
                                            style: kBodyText02,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
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
              onTap: () => Navigator.pushNamed(context, '/'),
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
    );
  }
}
