import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_moviedb/Model/popular_movies.dart';

class ApiProvider {
  String apiKey = '3a11cc5d9b39603cd9988407ca5ba136';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    //String url = '$baseUrl/movie/popular?api_key=$apiKey';
    //print(url);
    //  Response response =
    //   await client.get('$baseUrl/movie/popular?api_key=$apiKey');
    Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
