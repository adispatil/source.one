import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imdb_movie/service/upcoming_movie_service.dart';

import '../../model/popular_movies_response_model.dart';

part 'latest_movie_state.dart';

class LatestMovieCubit extends Cubit<LatestMovieState> {
  LatestMovieCubit() : super(LatestMovieInitial());

  final UpcomingMoviesService upcomingMoviesService = UpcomingMoviesService();

  Future<void> getLatestMovieList() async {
    emit(LatestMovieLoadingState());
    try {
      final response = await upcomingMoviesService.getUpcomingMovieList();
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
