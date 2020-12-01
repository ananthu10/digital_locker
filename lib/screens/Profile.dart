import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
    appBar: AppBar(
    title: Text('User Profile '),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0.0,
),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('image/download.png'),
                radius: 40,

              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ames',
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Email ID',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            Row(
              children: <Widget> [
              Icon(
                Icons.email,
                color: Colors.grey,
              ),
                Text(
                  '  ameslupus@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                     letterSpacing: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),

);
  }
}
