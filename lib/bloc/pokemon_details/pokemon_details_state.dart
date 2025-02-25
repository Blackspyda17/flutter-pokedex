part of 'pokemon_details_bloc.dart';

@immutable
sealed class PokemonDetailsState {}

final class PokemonDetailsInitial extends PokemonDetailsState {}

final class PokemonDetailsLoading extends PokemonDetailsState {}

final class PokemonDetailsSuccess extends PokemonDetailsState {
  final PokemonModel pokemon;

  PokemonDetailsSuccess({required this.pokemon});
}

final class PokemonDetailsFailed extends PokemonDetailsState {
  final String message;

  PokemonDetailsFailed({required this.message});
}
