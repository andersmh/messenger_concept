import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';
import '../widgets/favorite_contacts.dart';
import '../widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 1000,
      ),
      vsync: this,
    );

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () => {},
        ),
        title: Center(
          child: Text(
            'Messenger',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30.0,
                  ),
                  topRight: Radius.circular(
                    30.0,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                          animation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            FavoriteContacts(),
                          ],
                        ),
                      );
                    },
                  ),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
