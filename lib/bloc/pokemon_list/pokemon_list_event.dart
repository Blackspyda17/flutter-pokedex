part of 'pokemon_list_bloc.dart';

@immutable
sealed class PokemonListEvent {}

final class GetPokemonListEvent extends PokemonListEvent {
  final String url;

  GetPokemonListEvent({required this.url});
}

final class GetMorePokemonsEvent extends PokemonListEvent {
  final String url;

  GetMorePokemonsEvent({required this.url});
}