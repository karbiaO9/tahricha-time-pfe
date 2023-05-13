import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tahricha_app/palatte.dart';

import '../../home_widgets/find/locationinput.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withAlpha(220),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('HomePage');
            },
            icon: Icon(
              Icons.close,
            ),
            iconSize: 40,
          ),
        ],
        centerTitle: true,
        title: Text(
          'Filter',
          style: kBodyText3,
        ),
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Select Category',
              style: kBodyText2,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.red.shade100,
                            Colors.red.shade300,
                            Colors.red.shade500
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Sweet',
                            style: kBodyText123,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blueGrey, width: 1),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Brunch',
                            style: kBodyText12,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Pizza',
                            style: kBodyText12,
                          ),
                        ))),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Hot',
                            style: kBodyText12,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blueGrey, width: 1),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Salads',
                            style: kBodyText12,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Tunisia',
                            style: kBodyText12,
                          ),
                        ))),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Drinks',
                            style: kBodyText12,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.blueGrey, width: 1),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Pasta',
                            style: kBodyText12,
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('HomePage');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Dessert',
                            style: kBodyText12,
                          ),
                        ))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Location',
              style: kBodyText2,
            ),
          ),
          LocationInput(
            icon: Icons.location_city,
            hint: 'Location City',
            inputType: TextInputType.streetAddress,
            inputAction: TextInputAction.next,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Rating',
              style: kBodyText2,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red[600],
              borderRadius: BorderRadius.circular(50),
            ),
            height: 50,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Good',
                      style: kBodyText13,
                    )),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Bad  ',
                      style: kBodyText13,
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70.0),
                topRight: Radius.circular(70.0))),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('Filter');
                },
                child: Text(
                  'Reset',
                  style: kBodyText13,
                )),
            VerticalDivider(
              thickness: 2,
              color: Colors.white,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('HomePage');
                },
                child: Text(
                  'Apply',
                  style: kBodyText13,
                ))
          ],
        ),
      ),
    );
  }
}
