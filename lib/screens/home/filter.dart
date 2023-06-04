import 'package:flutter/material.dart';

import 'package:tahricha_app/palatte.dart';

import '../../home_widgets/find/locationinput.dart';
import 'home.dart';

class FilterPage extends StatefulWidget {
    static String _food='';
  static String _location='';
  static String _restaurant='';
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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('HomePage');
            },
            icon: const Icon(
              Icons.close,
            ),
            iconSize: 40,
          ),
        ],
        centerTitle: true,
        title: const Text(
          'Filter',
          style: kBodyText3,
        ),
        backgroundColor: Colors.red[600],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 40.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Food',
                  style: kBodyText2,
                ),
              ),
               Input(
                value:  FilterPage._food ,
                onChanged: (v){
                      FilterPage._food = v;
                },
                icon: Icons.fastfood,
                hint: 'Food ',
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Location',
                  style: kBodyText2,
                ),
              ),
               Input(
                value: FilterPage._location,
                onChanged: (v){
                      FilterPage._location = v;
                },
                icon: Icons.location_city,
                hint: 'Location City',
                inputType: TextInputType.streetAddress,
                inputAction: TextInputAction.next,
              ),
             const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Restaurant',
                  style: kBodyText2,
                ),
              ),
               Input(
                value: FilterPage._restaurant,
                onChanged: (v){
                      FilterPage._restaurant = v;
                },
                icon: Icons.restaurant,
                hint: 'Restaurant',
                inputType: TextInputType.streetAddress,
                inputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
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
                  setState(() {
                    FilterPage._food='';
                  FilterPage._location='';
                  FilterPage._restaurant='';
                  });
                  
                  HomePage.filtredPosts=HomePage.posts;
                },
                child: const Text(
                  'Reset',
                  style: kBodyText13,
                )),
            const VerticalDivider(
              thickness: 2,
              color: Colors.white,
            ),
            TextButton(
                onPressed: () {
                 // Navigator.of(context).pushNamed('HomePage');
              HomePage.filtredPosts= HomePage.posts.where(
                (element) {
                 return  element.food.toLowerCase().contains(FilterPage._food.toLowerCase())&&element.location.contains(FilterPage._location.toLowerCase())&&
                 element.restaurant.contains(FilterPage._restaurant.toLowerCase());
                } ).toList();

                },
                child: const Text(
                  'Apply',
                  style: kBodyText13,
                ))
          ],
        ),
      ),
    );
  }
}
