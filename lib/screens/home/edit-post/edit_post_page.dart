import 'package:flutter/material.dart';

import 'package:tahricha_app/home_widgets/Newpost/widgets.dart';
import 'package:tahricha_app/screens/home/edit-post/widgets/edit_post_button.dart';

import '../../../models/post.dart';
import '../../../palatte.dart';

class EditPostPage extends StatefulWidget {
  final Post post;

  const EditPostPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final TextEditingController _foodController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _restaurantController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  late String food;
  late String description;
  late String price;
  late String location;
  late String restaurant;
  late String image;
  late bool good;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    //init food
    _foodController.text = widget.post.food;
    food = widget.post.food;
    //init description
    _descriptionController.text = widget.post.description;
    description = widget.post.description;
    //init price
    _priceController.text = widget.post.price;
    price = widget.post.price;
    //init location
    _locationController.text = widget.post.location;
    location = widget.post.location;
    //init restaurant
    _restaurantController.text = widget.post.restaurant;
    restaurant = widget.post.restaurant;

    good=widget.post.good;

    image =widget.post.image;
  }

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
            'Edit post',
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 20,
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
                            onPressed: () {
                              setState(() {
                                good=true;
                              });
                            },
                            child:  Text(
                              'Good',
                              style: good==true ? kBodyText14: kBodyText13,
                            )),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                good=false;
                              });
                            },
                            child:  Text(
                              'Bad  ',
                              style: good==false ? kBodyText14: kBodyText13,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: EditPostButton(
                      good: good,
                      image: image,
                      buttonText: 'Save changes',
                      description: description,
                      food: food,
                      location: location,
                      price: price,
                      restaurant: restaurant,
                      id: widget.post.id,
                      userId: widget.post.userId,
                      likes: widget.post.likes,
                      dislikes: widget.post.dislikes,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
