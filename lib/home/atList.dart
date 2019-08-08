import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class AtList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AtListState();
}

class _AtListState extends State<AtList> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (_words[index] == loadingTag) {
          if (_words.length - 1 < 100) {
            _loadData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        return ListTile(
          title: Text(_words[index]),
        );
      },
      itemCount: _words.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0,
        );
      },
    );
  }

  void _loadData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }
}
