import 'package:flutter/material.dart';

import '../cubit/popular_movies_cubit.dart';
import 'popular_movie_page.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final PopularMoviesCubit _popularMoviesCubit = PopularMoviesCubit();
  int _selectedIndex = 0; //New

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() {
    _popularMoviesCubit.getPopularMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMDB Movies'),
      ),
      body: PopularMoviePage(popularMoviesCubit: _popularMoviesCubit),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(color: Colors.blue, size: 40),
        selectedItemColor: Colors.cyan,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded),
            label: 'Popular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_sharp),
            label: 'Latest',
          ),
        ],
      ),
    );
  }
}
