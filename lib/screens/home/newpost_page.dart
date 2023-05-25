import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

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
  
  final _formKey = GlobalKey<FormState>();

  String food = "";
  String description = "";
  String price = "";
  String location = "";
  String restaurant = "";
  int likes = 0;
  int dislikes = 0;
  bool? good=null;

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

  String? _checkEmptyField(String value){
    if(value.isEmpty){
      return "Required field";
    }
    return null;

  }

//get image from gallery
  XFile ? img=null;
  File ? f ;
  String fileName="";
  final ImagePicker _picker = ImagePicker();
  Future  getimage() async{
  img = await _picker.pickImage(source: ImageSource.gallery);
  if (img!= null){
    setState(() {
        f = File (img!.path);
  fileName=basename(f!.path);
    });
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                 const SizedBox(
                    height: 15,
                  ),
                 f==null? Container(
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
                      onPressed: () async{
                        await getimage();
                      },
                    ),
                  ):InkWell(
                    onTap: ()async{
                      await getimage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Image.file(f!,width: 300,height: 200,fit: BoxFit.cover,)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Food',
                      style: kBodyText2,
                    ),
                  ),
                  TextInput(
                    validator: (v){
                       return _checkEmptyField(v!);
                    },
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
                    validator: (v){
                       return _checkEmptyField(v!);
                    },
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
                    validator: (v){
                       return _checkEmptyField(v!);
                    },
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
                    validator: (v){
                       return _checkEmptyField(v!);
                    },
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
                    validator: (v){
                       return _checkEmptyField(v!);
                    },
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:const EdgeInsets.all(20.0),
                    child: PostButton(
                      good: good,
                      formKey: _formKey,
                        image:fileName,
                        f: f,
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
      ),
    );
  }
}
