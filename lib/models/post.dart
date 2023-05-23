import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  String id;
  final String food;
  final String description;
  final String location;
  final String restaurant;
  final String price;
  final String userId;
  final int likes;
  final int dislikes;

  Post({
    this.id = '',
    required this.food,
    required this.description,
    required this.location,
    required this.restaurant,
    required this.price,
    required this.userId,
    required this.likes,
    required this.dislikes,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'food': food,
        'description': description,
        'location': location,
        'price': price,
        'restaurant': restaurant,
        'userId': userId,
        "likes": likes,
        "dislikes": dislikes,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
      id: json['id'] ?? "",
      food: json['food'] ?? "",
      description: json['description'] ?? "",
      location: json['location'] ?? "",
      restaurant: json['restaurant'] ?? "",
      price: json['price'] ?? "",
      userId: json['userId'] ?? "",
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0);
}
