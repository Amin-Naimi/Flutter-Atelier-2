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
  Icon _heartIcon = const Icon(Icons.favorite_border, color: Colors.white);
  bool _checkLike = false;
  int _selectedIndex = 0;
  String _dispalay = "Défault: Home view ";

  void _likeThis() {
    setState(() {
      if (_checkLike) {
        _heartIcon = const Icon(Icons.favorite_border, color: Colors.white);
        _checkLike = false;
      } else {
        _heartIcon = const Icon(Icons.favorite, color: Colors.white);
        _checkLike = true;
      }
    });
  }

  void _clickedItem(int index) {
    _selectedIndex = index;
    setState(() {
      switch (_selectedIndex) {
        case 0:
          {
            _dispalay = "$_selectedIndex: Accueil view ";
          }
          break;
        case 1:
          {
            _dispalay = "$_selectedIndex: Paramétre view ";
          }
          break;
        case 2:
          {
            _dispalay = "$_selectedIndex: Compte view ";
          }
          break;
        default:
          _selectedIndex = _selectedIndex;
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
/********************************************************************/
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _dispalay,
            style: TextStyle(color: Colors.indigo, fontSize: 40),
          )
        ],
      )),
/********************************************************************/

      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.indigoAccent,
        child: _heartIcon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
/********************************************************************/
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        currentIndex: _selectedIndex, //l'element selectionner par default
        onTap: _clickedItem,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Paramètres',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: 'compte',
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
/*bottomNavigationBar: BottomAppBar(
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
      ),*/
