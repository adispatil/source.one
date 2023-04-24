import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/popular_movies_response_model.dart';
import '../../service/popular_movie_service.dart';

part 'latest_movie_state.dart';

class LatestMovieCubit extends Cubit<LatestMovieState> {
  LatestMovieCubit() : super(LatestMovieInitial());

  final PopularMoviesService popularMoviesService = PopularMoviesService();

  Future<void> getLatestMovieList() async {
    emit(LatestMovieLoadingState());
    try {
      final response = await popularMoviesService.getPopularMovieList();
      if (response == null) {
        emit(LatestMovieFailedState());
      } else if (response.isEmpty) {
        emit(LatestMovieEmptyState());
      } else {
        emit(LatestMoviesSuccessState(movieList: response));
      }
    } catch (e) {
      emit(LatestMovieFailedState());
    }
  }
}
