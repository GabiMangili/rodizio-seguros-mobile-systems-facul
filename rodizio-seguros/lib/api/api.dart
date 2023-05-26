// import 'package:dio/dio.dart';
//
// class Api{
//
//   static final _dio = createDio();
//   static final _baseAPI = addInterceptors(_dio);
//
//   static BaseOptions opts = BaseOptions(
//     responseType: ResponseType.json,
//     connectTimeout: Duration(milliseconds: 30000),
//     receiveTimeout: Duration(milliseconds: 30000),
//   );
//
//   static Dio createDio() {
//     return Dio(opts);
//   }
//
//   API(String baseUrl) {
//     opts.baseUrl = baseUrl;
//   }
//
//   Future<Response> get(String url) async {
//     try {
//       Response response = await _baseAPI.get(url);
//
//       return response;
//     } catch (error) {
//       rethrow;
//       print(error);
//     }
//   }
//
//   Future<Response> post(String url, {dynamic data}) async {
//     try {
//       Response response = await _baseAPI.post(url, data: data);
//
//       return response;
//     } catch (error) {
//       rethrow;
//       print(error);
//     }
//   }
// }