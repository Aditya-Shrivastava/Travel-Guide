import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/pandal_details_screen.dart';

import '../models/pandal.dart';
import '../providers/pandals.dart';

class FavoritePandals extends StatelessWidget {
  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    List<Pandal> _favoritePandals =
        Provider.of<Pandals>(context).favoritePandals;

    return Scaffold(
      appBar: AppBar(title: Text('Your Pandals')),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (direction) => {
            Provider.of<Pandals>(context, listen: false)
                .toggleFavorite(_favoritePandals[i].id)
          },
          background: Container(
            padding: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white, size: 20),
          ),
          key: Key(_favoritePandals[i].id),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(_favoritePandals[i].title),
                ),
                IconButton(
                  icon: Icon(
                    Icons.info_outline,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      PandalDetailsScreen.routeName,
                      arguments: _favoritePandals[i].id,
                    );
                  },
                )
              ],
            ),
          ),
        ),
        itemCount: _favoritePandals.length,
      ),
    );
  }
}