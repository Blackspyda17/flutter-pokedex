part of 'pokemon_details_bloc.dart';

@immutable
sealed class PokemonDetailsEvent {}

final class GetPokemonDetailsEvent extends PokemonDetailsEvent {
  final String url;

  GetPokemonDetailsEvent({required this.url});
}