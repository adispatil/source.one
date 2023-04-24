import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/cubit/data_cubit.dart';
import 'latest_movie_page.dart';
import 'popular_movie_page.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  late DataCubit<int> pageIndexCubit;

  final pages = [
    const PopularMoviePage(),
    const LatestMoviePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageIndexCubit = DataCubit(value: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMDB Movies'),
      ),
      body: BlocProvider(
        create: (context) => pageIndexCubit,
        child: BlocBuilder<DataCubit<int>, DataState<int>>(
          builder: (context, state) {
            return pages[state.value];
          },
        ),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => pageIndexCubit,
        child: BlocBuilder<DataCubit<int>, DataState<int>>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: pageIndexCubit.state.value,
              onTap: (int index) {
                pageIndexCubit.changeData(index);
              },
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
            );
          },
        ),
      ),
    );
  }
}
