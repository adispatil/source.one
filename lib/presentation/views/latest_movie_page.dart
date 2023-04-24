import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/latest_movie_cubit.dart';

class LatestMoviePage extends StatefulWidget {
  const LatestMoviePage({Key? key}) : super(key: key);

  @override
  State<LatestMoviePage> createState() => _LatestMoviePageState();
}

class _LatestMoviePageState extends State<LatestMoviePage> {
  final LatestMovieCubit _latestMoviesCubit = LatestMovieCubit();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    _latestMoviesCubit.getLatestMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _latestMoviesCubit,
        child: BlocBuilder<LatestMovieCubit, LatestMovieState>(
          builder: (context, state) {
            if (state is LatestMoviesSuccessState) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final item = state.movieList[index];
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 16.0,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        item.voteAverage?.toStringAsFixed(1) ??
                                            '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      const FaIcon(
                                        FontAwesomeIcons.calendarDays,
                                        size: 16.0,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '${item.releaseDate?.day}/${item.releaseDate?.month}/${item.releaseDate?.year}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  // DESCRIPTION
                                  Text(
                                    '${item.overview}',
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1.0,
                      color: Colors.grey,
                    );
                  },
                  itemCount: state.movieList.length);
            } else if (state is LatestMovieEmptyState) {
              return const Text('Popular movies list is empty');
            } else if (state is LatestMovieLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
