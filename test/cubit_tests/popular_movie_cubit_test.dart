//@dart=2.7
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_movie/presentation/cubit/popular_movies_cubit.dart';
import 'package:imdb_movie/service/popular_movie_service.dart';
import 'package:mockito/mockito.dart';

import '../test_configs/test_data_config_popular_movie.dart';

void main() {
  final PopularMoviesCubit _popularMoviesCubit = PopularMoviesCubit();
  final MockPopularMoviesService mockPopularMoviesService =
      MockPopularMoviesService();

  blocTest(
    'test bloc states when popular movie api calls and api gives success response',
    build: () => _popularMoviesCubit,
    act: (PopularMoviesCubit cubit) {
      cubit.getPopularMovieList();
    },
    setUp: () async {
      when(await mockPopularMoviesService.getPopularMovieList()).thenAnswer(
            (realInvocation) => TestDataConfigPopularMovie.popularMovieList,
      );
      when(await _popularMoviesCubit.getPopularMovieList()).thenAnswer(
            (realInvocation) => TestDataConfigPopularMovie.popularMovieList,
      );
    },
    verify: (PopularMoviesCubit cubit) {
      final state = cubit.state as PopularMoviesSuccessState;
      expect(state.movieList.length, 1);
    },
    expect: () => [
      // isA<PopularMoviesInitial>(),
      isA<PopularMoviesSuccessState>(),
    ],
  );
}

class MockPopularMoviesService extends Mock implements PopularMoviesService {}

class MockPopularMoviesCubit extends Mock implements PopularMoviesCubit {}
