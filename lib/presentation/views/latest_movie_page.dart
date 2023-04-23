import 'package:flutter/material.dart';

class LatestMoviePage extends StatefulWidget {
  const LatestMoviePage({Key? key}) : super(key: key);

  @override
  State<LatestMoviePage> createState() => _LatestMoviePageState();
}

class _LatestMoviePageState extends State<LatestMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 20.0,
              width: double.infinity,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              color: Colors.grey,
            );
          },
          itemCount: 20),
    );
  }
}
