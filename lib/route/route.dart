import 'package:flutter_pokedex/pages/pokemon_list_page.dart';
import 'package:go_router/go_router.dart';
import '../pages/pokemon_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'pokedex',
      builder: (context, state) => const PokemonListPage(),
      routes: [
        GoRoute(
          path: 'pokemon/:id',
          name: 'pokemon',
          builder: (context, state) {
            final url = state.extra as String;
            return PokemonPage(url: url);
          },
        ),
      ],
    ),
  ],
);
