import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tahricha_app/models/user.dart';

import 'package:tahricha_app/palatte.dart';

import '../../../models/post.dart';
import '../../../models/user.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String userId = '';

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    loadUserId();
  }

  loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString("userId") ?? "";
    });
  }

  Stream<List<LocalUser>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .where(
        'userId',
        isEqualTo: userId,
      )
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => LocalUser.fromJson(doc.data())).toList());

  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .where(
        'userId',
        isEqualTo: userId,
      )
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
            'My Profile',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: StreamBuilder<List<LocalUser>>(
                        stream: readUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong! ${snapshot.error} ');
                          } else if (snapshot.hasData) {
                            final users = snapshot.data!;

                            return buildUser(users[0]);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, 'NewPost'),
                      child: Text(
                        'What did you eat Last time ?!',
                        style: kBodyTextNEW,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
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
                  topRight: Radius.circular(50.0))),
          height: 60,
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
                      ),
                      const Text('Home'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.red,
                      ),
                      Text('Favorite'),
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
                        child: Icon(
                          Icons.add_circle_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 75.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.notifications,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const Text('Notifications'),
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
                        Icons.person_outline_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const Text('Profile'),
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
                    icon: const Icon(Icons.favorite_outline),
                    color: Colors.red),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      final docPost = FirebaseFirestore.instance
                          .collection('posts')
                          .doc('my-id');
                      docPost.update({'food': 'aaa'});
                    },
                    icon: const Icon(Icons.update),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
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
void _deletePost(String postId) {
  FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .delete()
      .then((value) {
    // Post deletion successful
    print('Post deleted successfully');
  }).catchError((error) {
    // Handle any error that occurred during deletion
    print('Error deleting post: $error');
  });
}

Widget buildUser(LocalUser user) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Text(
              user.name,
              style: kBodyTextP,
            ),
          ),
        ],
      ),
    );
