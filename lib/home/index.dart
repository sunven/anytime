import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Index();
  }
}

class _Index extends State<Index> with SingleTickerProviderStateMixin {
  var currentIndex = 1;
  var tabNames = ["全部", "进行中", "已完成"];
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnyTime"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          tabs: tabNames
              .map((c) => Tab(
                    text: c,
                  ))
              .toList(),
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tabNames.map((c) {
          return Text(c);
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite")),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text("Star")),
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.blue,
        onTap: _opTap,
      ),
    );
  }

  void _opTap(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
