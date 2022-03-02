import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> menu = [1, 2, 3];

  void resetItemList() {
    setState(() {
      menu = [1, 2, 3];
    });
  }

  void addItemToList() {
    setState(() {
      menu.add(menu.length + 1);
    });
  }

  Widget drawer() {
    return ListView(children: <Widget>[
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
        ),
        accountName: Text(
          'Angga Setiawan Wahyudin',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        accountEmail: Text(
          'anggasetiaw@gmail.com',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10, right: 30, left: 30),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.deepOrange,
                ),
                SizedBox(width: 10),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                ),
                SizedBox(width: 10),
                Text(
                  'Person',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.deepOrange,
                ),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }

  Widget scrollSamping() {
    return Container(
      height: 170,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.only(right: 20, bottom: 20),
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.android, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Menu ${menu[index].toString()}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget scrollBawah(List<int> list) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: list.map((item) => card(item.toString())).toList(),
        ));
  }

  Widget card(String text) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Icon(Icons.android, color: Colors.white, size: 30),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Menu $text",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Details"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas Pertama',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetItemList();
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: drawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItemToList();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            scrollSamping(),
            scrollBawah(menu),
          ],
        ),
      ),
    );
  }
}

class menuItem {
  final id;
  final menu;
  const menuItem({this.id, this.menu});
}
