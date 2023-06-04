import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tahricha_app/home_widgets/widgets/good_widget.dart';
import 'package:tahricha_app/models/user.dart';

import 'package:tahricha_app/palatte.dart';
import 'package:tahricha_app/screens/home/edit-post/edit_post_page.dart';


import '../../home_widgets/widgets/bad_widget.dart';
import '../../home_widgets/widgets/comment_widget.dart';
import '../../models/post.dart';
import '../../home_widgets/find/findRest.dart';

class HomePage extends StatefulWidget {
   static late LocalUser currentUser;
   static late List<LocalUser> users;
   static late List<Post> posts;
   static late List<Post>? filtredPosts=null;


  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search='';


          Stream<List<LocalUser>> readUser() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => LocalUser.fromJson(doc.data())).toList());

  
  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
          @override


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
            'Tahricha Home',
            textAlign: TextAlign.center,
            style: kBodyText3,
          ),
          backgroundColor: Colors.red[600],
        ),
        body: SafeArea(
          child: Stack(
            children: [
                  StreamBuilder<List<LocalUser>>(
                    stream: readUser(),
                    builder: (context, snapshot) {  
                       print(snapshot.data);
  
                       if (snapshot.hasError) {
                        return Text(
                            'Something went wrong! ${snapshot.error} ');
                      } else if (snapshot.hasData) {
                         HomePage.users = snapshot.data!;
                          HomePage.currentUser=HomePage.users.firstWhere((element) => element.userId==FirebaseAuth.instance.currentUser!.uid);
                          print("got userr  ${HomePage.currentUser.userId}");
                        return Container();

                        
                      }  return const Center(child: CircularProgressIndicator());
                    }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          onChanged: (v){
            setState(() {
               _search=v;
               HomePage.filtredPosts= HomePage.posts.where((element) => element.food.contains(_search)).toList();
              print('filtred       ${HomePage.filtredPosts}');

            });
             
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            hintText: 'find',
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, 'Filter'),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.tune_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
            prefixIcon:const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            hintStyle: kBodyText6,
          ),
          style: kBodyText,
        ),
      ),
    )
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<Post>>(
                        stream: readPosts(),
                        builder: (context, snapshot) {
                                                   


                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong! ${snapshot.error} ');
                          } else if (snapshot.hasData) {
                             HomePage.posts=snapshot.data!;
                             HomePage.filtredPosts ??= HomePage.posts;
                             
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount:  HomePage.filtredPosts!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PostWidget(post: HomePage.filtredPosts![index],user:HomePage.users);
                              },
                            );
                          } 
                            return Container();
                          }
                        ),
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
                onTap: () => Navigator.pushReplacementNamed(context, 'MyProfile'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline_outlined,
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





class PostWidget extends StatefulWidget {
  final Post post;
  final List<LocalUser> user;
  const PostWidget({Key? key,required this.post,required this.user}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}



class _PostWidgetState extends State<PostWidget> {
  late bool reported;
late bool saved;
 late bool liked =false;
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

    late ExpandableController contoller;
  bool toggel = false;

@override
  void initState() {
    contoller=ExpandableController();
    liked=HomePage.currentUser.likes.contains(widget.post.id);
    disliked=HomePage.currentUser.dislikes.contains(widget.post.id);
    saved=HomePage.currentUser.saved.contains(widget.post.id);
    reported=HomePage.currentUser.reports.contains(widget.post.id);

    super.initState();

  }
@override
  void dispose() {
    contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final  usr=widget.user.singleWhere((element) => element.userId==widget.post.userId);

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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Row(children: [
                                     CircleAvatar(backgroundImage: NetworkImage(usr!.pdp),),
                                  const SizedBox(width: 5,),
                                  Text(usr!.name,style:const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                  ],),
                                 
                                 widget.post.good? const GoodWidget(): const BadWidget()
                                ],),
                              )
                            ]
                      ),
                      Row(children: [
                        const SizedBox(
                          width: 30,
                        ),
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
                          width: 10,
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
                            onPressed: ()async {
                              if(!HomePage.currentUser.saved.contains(widget.post.id)){
                                setState(() {
                                  HomePage.currentUser.saved.add(widget.post.id);

                                });
                              }else{
                                setState(() {
                                  HomePage.currentUser.saved.remove(widget.post.id);
                                });
                                
                              }
                              final docUser = FirebaseFirestore.instance.collection('users').doc(HomePage.currentUser.id);
       await docUser.update({'saved':HomePage.currentUser.saved});
       print(HomePage.currentUser.saved);
                              setState(() {
                                saved=!saved;
                              });
                            },
                            icon:  Icon(Icons.bookmark_add_outlined,color:saved?Colors.blue:Colors.grey),
                            color: Colors.grey),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () async{
                              if(!HomePage.currentUser.reports.contains(widget.post.id)){
HomePage.currentUser.reports.add(widget.post.id);
                              final docUser = FirebaseFirestore.instance.collection('users').doc(HomePage.currentUser.id);
       await docUser.update({'reports':HomePage.currentUser.reports});
       setState(() {
         reported=true;
       });
                              }
                              
                              
                            },
                            icon: const Icon(Icons.report_gmailerrorred),
                            color: reported ? Colors.blue:Colors.grey,
                  )]),
                      Row(
                        children: [
                         const Text(
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
                         const Text(
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
                        const  Text(
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
                          const Text(
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
           expanded: CommentWidget(user: usr!, post: widget.post,))
                    ],
                  ),
                ),
              ),
  
    );
  }
}