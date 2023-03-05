import 'package:flutter/material.dart';

class AnuncioWidget extends StatelessWidget {
  AnuncioWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 14.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 450,
            child: Center(
                child: Image.asset(
              'assets/car.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ))),
      ),
    );
  }
}
