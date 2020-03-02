import 'package:english_words/english_words.dart';
import 'package:firebase_auth_login_youtube/bloc/viewVideo.dart';
import 'package:flutter/material.dart';

class RandomList extends StatefulWidget {

  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
//    final randomWord = WordPair.random();

    return Scaffold(
      body: Container(
        color: Colors.amber[200],
        height: 250,
        child: _myRandomList(_suggestions, _saved),
      ),
//        child: Text(randomWord.asPascalCase),
    );
  }

  _myRandomList(List<WordPair> _suggestions, Set<WordPair> _saved) =>
      ListView.builder(itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider();
        }

        var realIndex = index ~/ 2;

        if (realIndex >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _myShowRandomList(_suggestions[realIndex], _saved);
      });

  Widget _myShowRandomList(WordPair pair, _saved) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 2,
      ),
      trailing: Icon(
        alreadySaved?Icons.favorite:Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() {
          print(pair.asPascalCase);
          if (alreadySaved) { // true
            _saved.remove(pair);
          }
          else { // false
            _saved.add(pair);
          }
          print(_saved.toString());
        });
      },
    );
  }
}

//Widget ExportSaved(){
//  savedList() => Rand;
//}