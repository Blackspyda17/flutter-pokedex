part of 'pokemon_list_bloc.dart';

@immutable
sealed class PokemonListState {}

final class PokemonListInitial extends PokemonListState {}

final class PokemonListLoading extends PokemonListState {}

final class PokemonListSuccess extends PokemonListState {
  final PokemonListModel pokemonList;

  PokemonListSuccess({required this.pokemonList});
}

final class PokemonListFailed extends PokemonListState {
  final String message;

  PokemonListFailed({required this.message});
}