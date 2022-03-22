import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trace_moe_api/trace_moe_api.dart';

/// Exception thrown when AnimeSearch fails.
class SearchUrlRequestFailure implements Exception {}

/// Exception thrown when the provided url is not found.
class SearchAnimeNotFoundFailure implements Exception {}

class TraceMoeApiClient {
  TraceMoeApiClient({Dio? dioClient})
      : _dioClient = dioClient ?? Dio(options);

  static var options = BaseOptions(
      baseUrl: 'https://api.trace.moe',
      responseType: ResponseType.plain
  );

  final Dio _dioClient;

  /// Search a [Anime] by image URL'https://api.trace.moe/search?url=(query_url)'
  Future<TraceMoeResponse> animeSearchByPictureUrl(String query) async {
    Response<String> response;
    response = await _dioClient.get('/search', queryParameters: {'url': query});

    if (response.statusCode != 200) {
      throw SearchUrlRequestFailure();
    }

    Map<String, dynamic> parsedJson = json.decode(response.data.toString());
    final traceMoeResponse = TraceMoeResponse.fromJson(parsedJson);

    return traceMoeResponse;
  }

  Future<TraceMoeResponse> uploadImage(File file) async {
    Response response;

    String fileName = file.path.split('/').last;
    print("Filename: " + fileName);
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    response = await _dioClient.post(
      "/search",
      data: formData,
        options: Options(
          headers: {
            Headers.contentEncodingHeader : 'application/json',
          },
        )
    );

    if (response.statusCode != 200) {
      throw SearchUrlRequestFailure();
    }

    print(response.data.toString());

    // if (response.data.isEmpty) {
    //   throw SearchAnimeNotFoundFailure();
    // }

    Map<String, dynamic> parsedJson = json.decode(response.data.toString());

    print("Parsed JSON: " + parsedJson.toString());
    final traceMoeResponse = TraceMoeResponse.fromJson(parsedJson);

    return traceMoeResponse;
  }

}