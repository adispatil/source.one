// @dart=2.7
import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_movie/service/popular_movie_service.dart';
import 'package:mockito/mockito.dart';

import '../test_configs/test_data_config_popular_movie.dart';

void main(){

  MockPopularMoviesService mockPopularMoviesService = MockPopularMoviesService();

  test('Verify popular movie service returns proper data', () async {
    when(mockPopularMoviesService.getPopularMovieList())
        .thenAnswer((realInvocation) async {
      return TestDataConfigPopularMovie.popularMovieList;
    });

    final response = await mockPopularMoviesService.getPopularMovieList();

    expect(response.length, 1);
    expect(response[0].title.isNotEmpty, true);
  });

}

class MockPopularMoviesService extends Mock implements PopularMoviesService {}