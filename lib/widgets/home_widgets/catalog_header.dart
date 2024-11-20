import 'package:flutter/material.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';




class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    return Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Text("Catalog App",
                 style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: accentColor,
                 ),
                ),
                Text("Trending Products")
              ],
            );
  }
}