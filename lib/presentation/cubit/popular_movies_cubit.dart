import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imdb_movie/model/popular_movies_response_model.dart';

import '../../service/popular_movie_service.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(PopularMoviesInitial());

  final PopularMoviesService popularMoviesService = PopularMoviesService();

  Future<void> getPopularMovieList() async {
    // emit(PopularMoviesLoadingState());
    try {
      final response = await popularMoviesService.getPopularMovieList();
      if (response == null) {
        emit(PopularMoviesFailedState());
      } else if (response.isEmpty) {
        emit(PopularMoviesEmptyState());
      } else {
        emit(PopularMoviesSuccessState(movieList: response));
      }
    } catch (e) {
      emit(PopularMoviesFailedState());
    }
  }
}
