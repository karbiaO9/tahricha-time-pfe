import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/models/post.dart';

import 'package:tahricha_app/palatte.dart';

class EditPostButton extends StatelessWidget {
  final String food;
  final String description;
  final String location;
  final String restaurant;
  final String price;
  final String id;
  final String userId;
  final int likes;
  final bool good;
  final int dislikes;
  final String image;

  const EditPostButton({
    Key? key,
    required this.image,
    required this.buttonText,
    required this.food,
    required this.description,
    required this.location,
    required this.restaurant,
    required this.price,
    required this.id,
    required this.userId,
    required this.likes,
    required this.good,
    required this.dislikes,
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
            editPost(
              good:good,
              food: food,
              description: description,
              location: location,
              restaurant: restaurant,
              price: price,
              id: id,
              userId: userId,
              likes: likes,
              dislikes: dislikes,
            );
            Navigator.of(context).pushNamed('MyProfile');
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

  Future editPost(
      {required String food,
      required String description,
      required String location,
      required String restaurant,
      required String price,
      required String id,
      required bool good,
      required String userId,
      required int likes,
      required int dislikes}) async {
    final docPost = FirebaseFirestore.instance.collection('posts').doc(id);

    final post = Post(
      good:good,
      image: image,
        id: docPost.id,
        food: food,
        description: description,
        location: location,
        price: price,
        restaurant: restaurant,
        userId: userId,
        likes: likes,
        dislikes: dislikes);
    final json = post.toJson();

    await docPost.update(json);
  }
}
