import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint('Tapped button');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint('EmailTapped')),
          IconButton(icon: Icon(Icons.access_alarms), onPressed: _tapButton),
        ],
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, Again'),
            CustomButton()
/*               InkWell(
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue[200],
                      boxShadow: [BoxShadow(offset: Offset(0, -3))]),
                  child: Text(
                    'Tap me!',
                    style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                  ),
                  height: 50,
                ),
                onTap: () => debugPrint('Tapped...'),
              ), */
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Hello'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Hello'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: 'Hello')
        ],
        onTap: (int index) => debugPrint('Tapped item : $index'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () => debugPrint('Hello'),
        child: Icon(Icons.call_missed),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackBar = SnackBar(
            content: Text('Hello Again'),
            backgroundColor: Colors.blue.shade100,
          );

          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text('Button')));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text("Hello Fluter",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  fontStyle: FontStyle.italic))),
    );
  }
}
