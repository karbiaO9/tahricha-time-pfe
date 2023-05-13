import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tahricha_app/home_widgets/Newpost/widgets.dart';

import '../../home_widgets/Newpost/post_button.dart';
import '../../palatte.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
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
            'New podfest',
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Select Category',
                    style: kBodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
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
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                  border: Border.all(
                                      color: Colors.blueGrey, width: 1),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                    border: Border.all(
                                        color: Colors.blueGrey, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('HomePage');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(
                                        'Dessert',
                                        style: kBodyText12,
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Description',
                    style: kBodyText2,
                  ),
                ),
                TextInput(
                  icon: Icons.description,
                  hint: 'Description',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Food',
                    style: kBodyText2,
                  ),
                ),
                TextInput(
                  icon: Icons.restaurant_menu,
                  hint: 'Food',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Restaurant',
                    style: kBodyText2,
                  ),
                ),
                TextInput(
                  icon: Icons.table_restaurant_rounded,
                  hint: 'Restaurant',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Locatiion',
                    style: kBodyText2,
                  ),
                ),
                TextInput(
                  icon: Icons.place,
                  hint: 'Location',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Price',
                    style: kBodyText2,
                  ),
                ),
                TextInput(
                  icon: Icons.money_rounded,
                  hint: 'Price',
                  inputType: TextInputType.text,
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PostButton(
                    buttonText: 'Post',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
