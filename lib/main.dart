import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_details/pokemon_details_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:flutter_pokedex/service/pokemon_list_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pokedex/style/colors.dart';
import 'route/route.dart';
import 'service/pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonListBloc(PokemonListService())),
        BlocProvider(create: (context) => PokemonDetailsBloc(PokemonService())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Identity.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routerConfig: router,
      ),
    );
  }
}
