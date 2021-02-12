import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BizCard'),
        backgroundColor: Colors.blue.shade700,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [Box(), Photo()],
      ),
    );
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 170,
          width: 270,
          decoration: BoxDecoration(
              color: Colors.pink[400],
              boxShadow: [BoxShadow(blurRadius: 2)],
              borderRadius: BorderRadius.circular(13)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  'Paulo Dichone',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text('buildappswithpaulo.com', style: TextStyle(fontSize: 14)),
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.perm_identity,
                      size: 22,
                    ),
                    SizedBox(width: 2),
                    Text('1', style: TextStyle(fontSize: 13)),
                    SizedBox(width: 5),
                    Text('@buildappswithme', style: TextStyle(fontSize: 14))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(bottom: 180),
        decoration: BoxDecoration(
            color: Colors.pink[400],
            border: Border.all(color: Colors.pink[400]),
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("assets/images/6.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
