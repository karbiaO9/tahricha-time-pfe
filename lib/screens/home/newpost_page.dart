import 'package:flutter/material.dart';

import 'package:tahricha_app/home_widgets/Newpost/widgets.dart';

import '../../palatte.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _foodController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _restaurantController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  String food = "";
  String description = "";
  String price = "";
  String location = "";
  String restaurant = "";
  int likes = 0;
  int dislikes = 0;

  void onChangedFood(String value) {
    setState(() {
      food = value;
    });
  }

  void onChangedDescription(String value) {
    setState(() {
      description = value;
    });
  }

  void onChangedPrice(String value) {
    setState(() {
      price = value;
    });
  }

  void onChangedLocation(String value) {
    setState(() {
      location = value;
    });
  }

  void onChangedRestaurant(String value) {
    setState(() {
      restaurant = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withAlpha(220),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'New post',
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color.fromRGBO(249, 50, 9, .2),
                    border: Border.all(
                      color: const Color.fromRGBO(229, 57, 53, 1),
                      width: 5.0,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_outlined),
                    iconSize: 50,
                    color: Colors.red[600],
                    onPressed: () {},
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                  onChanged: onChangedFood,
                  textController: _foodController,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                  onChanged: onChangedDescription,
                  textController: _descriptionController,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                  onChanged: onChangedRestaurant,
                  textController: _restaurantController,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                  onChanged: onChangedLocation,
                  textController: _locationController,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                  onChanged: onChangedPrice,
                  textController: _priceController,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
                          child: const Text(
                            'Good',
                            style: kBodyText13,
                          )),
                      const VerticalDivider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Bad  ',
                            style: kBodyText13,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: PostButton(
                      buttonText: 'Post',
                      description: description,
                      food: food,
                      location: location,
                      price: price,
                      restaurant: restaurant,
                      likes: likes,
                      dislikes: dislikes),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
