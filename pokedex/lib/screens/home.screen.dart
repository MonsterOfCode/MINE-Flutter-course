import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/consts/app.consts.dart';
import 'package:pokedex/widgets/home/pokemon.list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -(240 / 1.62),
              left: screenWidth - (240 / 1.65),
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  AppConsts.assetImageBgBlack,
                  height: 240,
                  width: 240,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Pokedex",
                        style: TextStyle(
                            fontFamily: "Google",
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  PokemonList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
