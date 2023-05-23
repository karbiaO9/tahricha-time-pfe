import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:tahricha_app/palatte.dart';

import '../../Models/post.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(249, 50, 9, .2),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saved Posts',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: StreamBuilder<List<Post>>(
                        stream: readPosts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong! ${snapshot.error} ');
                          } else if (snapshot.hasData) {
                            final posts = snapshot.data!;
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: posts.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                return _Post(posts[index]);
                              },
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey, width: 1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'HomePage'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 37.0, // Increase the size here
                      ),
                      const Text('Home'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'NewPost'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        heightFactor: 0,
                        widthFactor: 0.5,
                        child: Icon(
                          Icons.add_circle_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 80.0, // Maintain the previous size for New Post
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'MyProfile'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark_outline,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 37.0, // Increase the size here
                      ),
                      const Text('My Profile'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _Post(Post post) => Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 200,
        width: 300,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
                const Text(
                  '10',
                  style: kBodyText001,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_down),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
                const Text(
                  '4',
                  style: kBodyText001,
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark),
                    color: Colors.blue),
                const SizedBox(
                  width: 10,
                ),
              ]),
              Row(
                children: [
                  Text(
                    'Food :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    post.food,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Description :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    post.description,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Location :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    post.location,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Restaurant :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    post.restaurant,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price:  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    post.price,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
