import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/constants.dart';
import '../config/url_constants.dart';
import '../model/popular_movies_response_model.dart';

class PopularMoviesService {
  Future<List<PopularMovieResponseResult>?> getPopularMovieList() async {
    Map<String, dynamic> queryParameters = {
      'api_key': Constants.apiKey,
      'language': Constants.language,
      'page': Constants.page,
    }.map((key, value) => MapEntry(key, value.toString()));

    try {
      final uri = Uri.parse('${UrlConstants.host}${UrlConstants.popularMovies()}')
          .replace(queryParameters: queryParameters);

      // final uri = Uri.https(
      //     UrlConstants.host, UrlConstants.popularMovies(), queryParameters);

      final response = await http.get(uri);

      // final url = UrlConstants.userProfleUrl(userName);
      // final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        PopularMoviesResponseModel popularMovieResponse =
        PopularMoviesResponseModel.fromJson(body);

        return popularMovieResponse.results;
      } else {
        throw "Unable to retrieve popular movies.";
      }
    } catch(ex) {
      print(ex);
      return [];
    }
  }
}
