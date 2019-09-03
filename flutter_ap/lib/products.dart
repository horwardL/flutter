import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]); //[ ] optional argument

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map(
            (element) => Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/icon.png'),
                  Text(element)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
