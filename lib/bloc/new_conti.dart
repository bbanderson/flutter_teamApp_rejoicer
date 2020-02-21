import 'package:flutter/material.dart';

String rawData = '''D. 날 자녀라 하시네(Who You Say I Am)
E. You Still Love Me
Bb. 주님 내게 선하신 분
G. 성령의 불타는 교회
E-F. Mighty generation
F. 주의 나라가 비전인 세대
D. 그 이름 아름답도다(What A Beautiful Name)
묶인것들 끊어지네(Break Every Chain)
그 이름 아름답도다(What A Beautiful Name) ''';

List<String> finedData = rawData.split('. ');

List<String> newConti = [
  'D. 날 자녀라 하시네',
  'E. You Still Love Me',
  'Bb. 주님 내게 선하신 분',
  'G. 성령의 불타는 교회',
  'E-F. Mighty generation',
  'F-G. 주의 나라가 비전인 세대',
  'D. 그 이름 아름답도다(What A Beautiful Name)',
      'D. 묶인것들 끊어지네(Break Every Chain)'
];
Set realConti;

class NewContiList extends StatefulWidget {


  Set goToSave = _NewContiListState().savedConti();
//  int i = 0;



  @override
  _NewContiListState createState() => _NewContiListState();
}

class _NewContiListState extends State<NewContiList> {

  Set<String> saved = Set<String>();
  savedConti() {
    print(saved);
//    return saved;
//    return goToSave;
  }


  @override
  Widget build(BuildContext context) {
    widget.goToSave = saved;
    return Scaffold(
      body: Container(
        child: _newContiList(),
      ),
    );
  }

  _newContiList() => ListView.builder(itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider();
        }

        var realIndex = index ~/ 2;

        if (realIndex >= newConti.length) {
          return null;
        }

//        if (realIndex >= newConti.length) {
//          _suggestions.addAll(generateWordPairs().take(10));
//        }

        return _myShowRandomList(newConti[realIndex]);
      });

  Widget _myShowRandomList(String song) {
    final bool alreadySaved = saved.contains(song);

    return ListTile(
      title: Text(
        song,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() {
          print(song);
          if (alreadySaved) {
            // true
            removeFavorite(song);
//          saved.remove(song);
          } else {
            // false
            addFavorite(song);
//          saved.add(song);
          }
          print(saved.toString());
        });
      },
    );
  }


  Set removeFavorite(song) {
    saved.remove(song);
    return saved;

  }

  Set addFavorite(song) {
    saved.add(song);
    return saved;
  }

}
