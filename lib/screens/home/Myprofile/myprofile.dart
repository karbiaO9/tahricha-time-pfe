import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/home_widgets/widgets/comment_widget.dart';
import 'package:tahricha_app/models/report.dart';
import 'package:tahricha_app/models/user.dart';

import 'package:tahricha_app/palatte.dart';
import 'package:tahricha_app/screens/home/Myprofile/Editprofile/editprofile.dart';
import 'package:tahricha_app/screens/home/edit-post/edit_post_page.dart';
import 'package:tahricha_app/screens/login_page.dart';


import '../../../home_widgets/widgets/bad_widget.dart';
import '../../../home_widgets/widgets/good_widget.dart';
import '../../../models/post.dart';
import '../home.dart';

class MyProfilePage extends StatefulWidget {

   MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  
  String userId = '';

  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }


  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .where(
        'userId',
        isEqualTo: FirebaseAuth.instance.currentUser!.uid
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
         automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'My Profile',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          actions: [
            IconButton(
              icon:const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditProfilePage(user:HomePage.currentUser)));
              },
            ),
            IconButton(
              icon:const Icon(Icons.exit_to_app_outlined),
              onPressed: () {
showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("log out"),
                  content: const Text("are you sure you want to log out"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async{
                       Navigator.of(context).popAndPushNamed('LogIn');
                        await FirebaseAuth.instance.signOut();
                      },
                      child: const Text("yes",style: TextStyle(color:Colors.grey),),
                    ),
                     TextButton(
                      onPressed: () async{
                         Navigator.of(ctx).pop();

                      },
                      child: const Text("no"),
                    ),
                  ],
                ),
              );              },
            ),
          ],
          backgroundColor: Colors.red[600],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUser(HomePage.currentUser),
               const SizedBox(
                  height: 2,
                ),
             
               const SizedBox(
                  height: 5,
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
                              return ProfilePost(post:posts[index]);
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
              // Home
              InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, 'HomePage'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 37.0, // Increase the size here
                      ),
                      const Text('Home'),
                    ],
                  ),
                ),
              ),
              // New Post
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
              // Saved
              InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, 'SavedPage'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark_outline,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 37.0, // Increase the size here
                      ),
                      const Text('Saved'),
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
Widget buildUser(LocalUser user) => Padding(
  padding: const EdgeInsets.all(18.0),
  child:   SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               CircleAvatar(backgroundImage: NetworkImage(user.pdp),radius: 60,),
  
            Text(
              user.name,
              style: kBodyTextP,
            ),
          ],
        ),
      ),
);
}
  bool liked =false;
bool disliked =false;
Future<void> like_btn(Post post) async {
  List<dynamic> _likedPostes = HomePage.currentUser.likes;
  List<dynamic> _dislikedPostes = HomePage.currentUser.dislikes;


  if(!_likedPostes.contains(post.id) && !_dislikedPostes.contains(post.id)){
    post.likes++;
    HomePage.currentUser.likes.add(post.id);
    liked=true;
    disliked=false;
  }else if(!_likedPostes.contains(post.id) && _dislikedPostes.contains(post.id)){
      post.likes++;
      HomePage.currentUser.likes.add(post.id);
      post.dislikes--;
      HomePage.currentUser.dislikes.remove(post.id);
      liked=true;
      disliked=false;
  }
      final docPost = FirebaseFirestore.instance.collection('posts').doc(post.id);
       await docPost.update(post.toJson());
       final docUser = FirebaseFirestore.instance.collection('users').doc(HomePage.currentUser.id);
       await docUser.update(HomePage.currentUser.toJson());


}
Future<void> dislike_btn(Post post)async{
  List<dynamic> _likedPostes = HomePage.currentUser.likes;
  List<dynamic> _dislikedPostes = HomePage.currentUser.dislikes;


  if(!_likedPostes.contains(post.id) && !_dislikedPostes.contains(post.id)){
    post.dislikes++;
    HomePage.currentUser.dislikes.add(post.id);
    disliked=true;
    liked=false;
  }else if(!_dislikedPostes.contains(post.id) && _likedPostes.contains(post.id)){
      post.dislikes++;
      HomePage.currentUser.dislikes.add(post.id);
      post.likes--;
      HomePage.currentUser.likes.remove(post.id);
      disliked=true;
      liked=false;
  }
  final docPost = FirebaseFirestore.instance.collection('posts').doc(post.id);
       await docPost.update(post.toJson());
       final docUser = FirebaseFirestore.instance.collection('users').doc(HomePage.currentUser.id);
       await docUser.update(HomePage.currentUser.toJson());
}



  

class ProfilePost extends StatefulWidget {
 final Post post;
  const ProfilePost({Key? key,required this.post}) : super(key: key);
  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  late ExpandableController contoller;
  bool toggel = false;
  @override
  void initState() {
    super.initState();
    contoller=ExpandableController();
    liked=HomePage.currentUser.likes.contains(widget.post.id);
  disliked=HomePage.currentUser.dislikes.contains(widget.post.id);
  
  }
  @override
  void dispose() {
    super.dispose();
    contoller.dispose();
  }
  @override
  Widget build(BuildContext context) {
        CollectionReference reports = FirebaseFirestore.instance.collection('reports');
        final querySnapshot=reports.get();

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children:[
                     ClipRRect(
                      borderRadius:const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(Color.fromARGB(34, 4, 4, 4), BlendMode.darken), 
                        child: Image.network(widget.post.image ,  width: 400,height: 200,fit: BoxFit.cover,))),
                        Positioned(
                          right:0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.post.good? const GoodWidget(): const BadWidget(),
                          ),
                        )
                      ]
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(onPressed: ()async{
                  await like_btn(widget.post);
                }, icon: Icon(Icons.thumb_up,color: liked?Colors.blue:Colors.grey,)),
                Text(
                  widget.post.likes.toString(),
                  style: kBodyText001,
                ),
                const SizedBox(
                  width: 10,
                ),
                  IconButton(onPressed: ()async{
                  await dislike_btn(widget.post);
                }, icon: Icon(Icons.thumb_down,color: disliked?Colors.blue:Colors.grey,)),
                Text(
                  widget.post.dislikes.toString(),
                  style: kBodyText001,
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: () {
                      contoller.toggle();
                      setState(() {
                        toggel=!toggel;
                      });
                    },
                    icon:  Icon(Icons.comment,color: toggel?Colors.blue:Colors.grey,),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
                const SizedBox(
                  width: 10,
                ),
               
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPostPage(post: widget.post)),
                      );
                    },
                    icon: const Icon(Icons.update),
                    color: const Color.fromRGBO(62, 62, 104, 100)),
                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('reports').get(),
                  builder:(_,data) {
                    if(data.hasData){
               final List<DocumentSnapshot> documents = data.data!.docs;
                  print('rep data ${documents[0]['id']}');
                List<Report> rp = documents.map((doc) => Report.fromJson(doc.data() as Map<String,dynamic>)).toList();
return IconButton(
                      onPressed: () {
                        _deletePost(widget.post.id);
                                     FirebaseFirestore.instance
                        .collection('reports')
                        .doc(rp.firstWhere((element) => element.postId==widget.post.id).id)
                        .delete();
                      },
                      icon: const Icon(Icons.delete),
                      color: const Color.fromRGBO(62, 62, 104, 100));

                    }
                 return Container();

//                    print('repppp ${data.data.}');
                    
                  },
                ),
              ]),
              Row(
                children: [
               const   Text(
                    'Food :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    widget.post.food,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                const  Text(
                    'Description :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    widget.post.description,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                 const Text(
                    'Location :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    widget.post.location,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                const  Text(
                    'Restaurant :  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    widget.post.restaurant,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                const  Text(
                    'Price:  ',
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    widget.post.price,
                    style: kBodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
         ExpandablePanel(
          controller: contoller,
          collapsed: Container(),
           expanded: CommentWidget(user: HomePage.currentUser, post: widget.post,))
            ],
          ),
        ),
      ),
    );
}

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


  }
