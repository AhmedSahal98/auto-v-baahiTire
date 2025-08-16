import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Topartwidget(),
        ],
      ),
    );
  }
}
