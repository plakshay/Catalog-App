import 'package:flutter/material.dart';




class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Text("Catalog App",
                 style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 16, 0, 96),
                 ),
                ),
                Text("Trending Products")
              ],
            );
  }
}