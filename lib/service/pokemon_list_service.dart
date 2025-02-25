import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon_list_model.dart';


class PokemonListService {
  Future<PokemonListModel> getPokemonList(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return PokemonListModel.fromJson(jsonDecode(response.body));
    } catch (_) {
      rethrow;
    }
  }
}
