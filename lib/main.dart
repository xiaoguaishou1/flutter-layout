import 'package:demo/bottom_page/about.dart';
import 'package:demo/bottom_page/home.dart';
import 'package:demo/bottom_page/my.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  _NavigatorFuc(){
    Navigator.pop(context);
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _bottomNavPages..add(HomePage())..add(AboutPage())..add(MyPage());
  }
  List<Widget> _bottomNavPages = List();
  @override
  Widget build(BuildContext context) {
    Widget userHeader =UserAccountsDrawerHeader(
      accountEmail: new Text('760695955@qq.com'),
      accountName: new Text('Tom'),
      currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.itying.com/images/flutter/3.png'),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.itying.com/images/flutter/2.png'),
            fit: BoxFit.cover,
          ),
        ),
    );
      return Scaffold(
        appBar: AppBar(title: Text('Drawer'),),
        body:_bottomNavPages[_selectedIndex],
        drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              userHeader,
              ListTile(
                title: Text('选项卡1'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.school),
                ),
                onTap: _NavigatorFuc,
              ),
              ListTile(
                title: Text('选项卡2'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.pages),
                ),
                onTap: _NavigatorFuc,
              ),
              ListTile(
                title: Text('选项卡3'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.wb_iridescent),
                ),
                onTap: _NavigatorFuc,
              ),
              ListTile(
                title: Text('选项卡4'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.mail),
                ),
                onTap: _NavigatorFuc,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('我的')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('关于')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped
    ));
  }
}


