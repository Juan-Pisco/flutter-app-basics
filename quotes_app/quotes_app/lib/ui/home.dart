import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int index = 0;

  List quotes = [
    'You’ve gotta dance like there’s nobody watching, love like you’ll never be hurt, sing like there’s nobody listening, and live like it’s heaven on earth',
    'Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten',
    'Everything you can imagine is real',
    'Don’t be afraid to give up the good to go for the great'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quotes App'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    child: Center(
                        child: Text(quotes[index % quotes.length],
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                                fontSize: 18)))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent.shade700,
                icon: Icon(Icons.wb_sunny),
                label: Text('Inspire me',
                    style: TextStyle(color: Colors.white, fontSize: 18.8)),
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        )));
  }

  void _showQuote() {
    //increment index counter by 1
    setState(() {
      index += 1;
      debugPrint('$index');
    });
  }
}
