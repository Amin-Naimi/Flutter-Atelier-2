import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _heartIcon = Icon(Icons.favorite_border, color: Colors.white);
  bool _checkLike = false;

  void _likeThis() {
    setState(() {
      if (_checkLike) {
        _heartIcon = Icon(Icons.favorite_border, color: Colors.white);
        _checkLike = false;
      } else {
        _heartIcon = Icon(Icons.favorite, color: Colors.white);
        _checkLike = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(onPressed: _likeThis, icon: _heartIcon),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.indigoAccent,
        child: _heartIcon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigoAccent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.add_location_alt,
                    color: Colors.white,
                  ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.east,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
