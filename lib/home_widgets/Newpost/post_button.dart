import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:tahricha_app/palatte.dart';

import '../../models/post.dart';

class PostButton extends StatelessWidget {
  final String food;
  final String description;
  final String location;
  final String restaurant;
  final String price;
  final int likes;
  final bool? good;
  final int dislikes;
  final GlobalKey<FormState> formKey;
  final String image;
  final File? f;


  const PostButton({
    Key? key,
     this.f,
     required this.good,
    required this.buttonText,
    required this.food,
    required this.description,
    required this.location,
    required this.restaurant,
    required this.price,
    required this.likes,
    required this.dislikes,
    required this.formKey,
    required this.image
  }) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFF5663FE).withOpacity(0.5),
          border: Border.all(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: () {
            print('pressed');
           if( formKey.currentState!.validate()&&f!=null&&good!=null){
              createPost(
                food: food,
                description: description,
                location: location,
                restaurant: restaurant,
                price: price,
                likes: likes,
                image:image,
                f:f!,
                dislikes: dislikes);
            Navigator.of(context).pushNamed('HomePage');
           }
            
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              buttonText,
              style: kBodyText1,
            ),
          )),
    );
  }

  Future createPost(
      {required String food,
      required String description,
      required String location,
      required String restaurant,
      required String price,
      required int likes,
      required File f,
      required String image,
      required int dislikes}) async {
    final docPost = FirebaseFirestore.instance.collection('posts').doc();
     final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${image+DateTime.now().toString()}');
    await ref.putFile(f);
    String url = await ref.getDownloadURL();

    final post = Post(
        good: good!,
        id: docPost.id,
        food: food,
        image: url,
        description: description,
        location: location,
        price: price,
        restaurant: restaurant,
        userId: FirebaseAuth.instance.currentUser!.uid.toString(),
        likes: likes,
        dislikes: dislikes);
    final json = post.toJson();

    await docPost.set(json);
  }
}
