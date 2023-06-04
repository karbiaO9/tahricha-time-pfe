import 'package:flutter/material.dart';

import 'package:tahricha_app/palatte.dart';

import '../../screens/home/home.dart';

class FindR extends StatefulWidget {
   FindR({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;
  final TextInputAction inputAction;

  @override
  State<FindR> createState() => _FindRState();
}

class _FindRState extends State<FindR> {
  String _search='';

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            hintText: widget.hint,
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
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                widget.icon,
                color: Colors.grey,
              ),
            ),
            hintStyle: kBodyText6,
          ),
          style: kBodyText,
        ),
      ),
    );
  }
}
