import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedWordPairs extends StatefulWidget {
  const SavedWordPairs({required this.saved, required this.tapped, Key? key})
      : super(key: key);

  final Set<WordPair> saved;
  final Function(WordPair) tapped;

  @override
  State<SavedWordPairs> createState() => _SavedWordPairsState();
}

class _SavedWordPairsState extends State<SavedWordPairs> {
  @override
  Widget build(BuildContext context) {
    Set<WordPair> mySaved = widget.saved;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(
        children: List.generate(
          mySaved.length,
          (index) {
            WordPair pair = mySaved.elementAt(index);
            return ListTile(
              onTap: () {
                setState(() {
                  mySaved.remove(pair);
                });
                widget.tapped(pair);
              },
              title: Text(
                pair.asPascalCase,
              ),
            );
          },
        ),
      ),
    );
  }
}
