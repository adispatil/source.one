part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesSuccessState extends PopularMoviesState {
  final List<PopularMovieResponseResult> movieList;
  const PopularMoviesSuccessState({required this.movieList});
}

class PopularMoviesFailedState extends PopularMoviesState {}

class PopularMoviesEmptyState extends PopularMoviesState {}
