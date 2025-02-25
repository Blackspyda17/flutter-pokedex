import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/pokemon_list/pokemon_list_bloc.dart';
import '../const/service_const.dart';
import '../components/pokemon_card.dart';
import '../style/colors.dart';
import '../style/elevation.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  int limit = 16;

  bool isBottom = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<PokemonListBloc>().add(GetPokemonListEvent(url: '$baseUrl/pokemon/?offset=0&limit=$limit'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Identity.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_pokemon_logo.svg',
                        width: 100,
                      ),
                      const SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/icons/ic_pokedex.svg',
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  boxShadow: InnerShadow.dp2,
                  borderRadius: BorderRadius.circular(8),
                  color: GrayScale.white,
                ),
                child: BlocBuilder<PokemonListBloc, PokemonListState>(
                  builder: (context, state) {
                    if (state is PokemonListSuccess) {
                      final results = state.pokemonList.results;
                      _scrollController.addListener(() {
                        if ((_scrollController.position.pixels == _scrollController.position.maxScrollExtent) &&
                            state.pokemonList.next != null) {
                          context.read<PokemonListBloc>().add(GetMorePokemonsEvent(url: state.pokemonList.next!));
                        }
                      });

                      return SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 12,
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                              ),
                              itemCount: results.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < results.length) {
                                  return PokemonCard(url: results[index].url);
                                }
                                if (state.pokemonList.next != null) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    } else if (state is PokemonListFailed) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is PokemonListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
