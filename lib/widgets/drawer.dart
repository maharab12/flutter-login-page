import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final imageUrl =  "assets/images/ela.jpg";
  @override
  Widget build(BuildContext context) {
   
    return Drawer(
      child: Container(
        color: Colors.black26,
        child: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  //color: Colors.black26,
                ),
                accountName: Text("maharab hasan talukder"),
                accountEmail: Text("maharab@gamil.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home),
              iconColor:Colors.black,
              title: Text("Home",
              textScaleFactor: 1.5,
              style: TextStyle( fontWeight: FontWeight.bold,),
              ),

            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              iconColor:Colors.black,
              title: Text("Profile",
                textScaleFactor: 1.5,
                style: TextStyle( fontWeight: FontWeight.bold,),
              ),

            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail),
              iconColor:Colors.black26,
              title: Text("mail me",
                textScaleFactor: 1.3,
                style: TextStyle( fontWeight: FontWeight.w400),
              ),

            ),

          ],
        ),
      ),
    );
  }
}

