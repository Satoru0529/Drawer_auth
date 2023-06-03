import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(_user?.photoURL ?? ''),
                      radius: 35,
                    ),
                    SizedBox(height: 5),
                    Text(
                      _user?.displayName ?? 'Guest',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: (){
                //ここにTap時のコードを書く
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                //ここにTap時のコードを書く
              },
            ),
          ],
        ),
      ),
    );
  }
}
