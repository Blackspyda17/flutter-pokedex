import 'package:flutter/material.dart';
import '../extentions/string.dart';
import '../style/colors.dart';
import '../style/typography.dart';

class PokemonTypeLabel extends StatelessWidget {
  final String typeName;

  const PokemonTypeLabel({super.key, required this.typeName});

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = PokemonType.getColor(typeName.toLowerCase());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        typeName.capitalizeFirstLetter(),
        style: Header.subtitle3.copyWith(color: Colors.white),
      ),
    );
  }
}
