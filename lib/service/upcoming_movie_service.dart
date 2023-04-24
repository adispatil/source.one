import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/constants.dart';
import '../config/url_constants.dart';
import '../model/popular_movies_response_model.dart';

class UpcomingMoviesService {
  Future<List<PopularMovieResponseResult>?> getUpcomingMovieList() async {
    Map<String, dynamic> queryParameters = {
      'api_key': Constants.apiKey,
      'language': Constants.language,
      'page': Constants.page,
    }.map((key, value) => MapEntry(key, value.toString()));

    try {
      final uri =
      Uri.parse('${UrlConstants.host}${UrlConstants.upComingMovies()}')
          .replace(queryParameters: queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        PopularMoviesResponseModel popularMovieResponse =
        PopularMoviesResponseModel.fromJson(body);

        return popularMovieResponse.results;
      } else {
        throw "Unable to retrieve popular movies.";
      }
    } catch (ex) {
      return [];
    }
  }
}
