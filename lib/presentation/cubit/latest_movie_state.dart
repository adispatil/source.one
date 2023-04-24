part of 'latest_movie_cubit.dart';

abstract class LatestMovieState extends Equatable {
  const LatestMovieState();

  @override
  List<Object> get props => [];
}

class LatestMovieInitial extends LatestMovieState {}

class LatestMovieLoadingState extends LatestMovieState {}

class LatestMoviesSuccessState extends LatestMovieState {
  final List<PopularMovieResponseResult> movieList;

  const LatestMoviesSuccessState({required this.movieList});
}

class LatestMovieFailedState extends LatestMovieState {}

class LatestMovieEmptyState extends LatestMovieState {}
