import 'package:dio/dio.dart';
import 'package:rick_and_morty_api_bloc_app/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data['results']);
      return response.data['results'];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
