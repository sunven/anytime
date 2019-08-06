import 'package:flutter/material.dart';
import 'package:anytime/planForm.dart';

class PlanList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanList();
}

class _PlanList extends State<PlanList> with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  List tabs = ["全部", "进行中", "已完成"];
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("随时"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlanForm();
              }));
            },
          )
        ],
        bottom: TabBar(
            tabs: tabs.map((c) => Tab(text: c)).toList(),
            controller: _tabController),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("favorite")),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text("star"))
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
