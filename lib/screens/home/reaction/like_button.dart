import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/models/post.dart';

class LikeButton extends StatelessWidget {
  final String food;
  final String description;
  final String location;
  final String restaurant;
  final String price;
  final String id;
  final String userId;
  final int likes;
  final int dislikes;
  const LikeButton({
    Key? key,
    required this.food,
    required this.description,
    required this.location,
    required this.restaurant,
    required this.price,
    required this.id,
    required this.userId,
    required this.likes,
    required this.dislikes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          editPost(
              food: food,
              description: description,
              location: location,
              restaurant: restaurant,
              price: price,
              id: id,
              userId: userId,
              likes: likes,
              dislikes: dislikes);
        },
        icon: const Icon(Icons.thumb_up),
        color: const Color.fromRGBO(62, 62, 104, 100));
  }

  Future editPost(
      {required String food,
      required String description,
      required String location,
      required String restaurant,
      required String price,
      required String id,
      required String userId,
      required int likes,
      required int dislikes}) async {
    final docPost = FirebaseFirestore.instance.collection('posts').doc(id);

    final post = Post(
        id: docPost.id,
        food: food,
        description: description,
        location: location,
        price: price,
        restaurant: restaurant,
        userId: userId,
        likes: likes + 1,
        dislikes: dislikes);

    final json = post.toJson();

    await docPost.update(json);
  }
}