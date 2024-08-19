// import 'package:dio/dio.dart';
// import 'package:get/get.dart' as getx;
//
// import '../constants/api_keys.dart';
// class BaseApi {
//   String? get token {
//     return getx.Get.find<CurrentUserDataController>().currentUser?.token;
//   }
//
//   final Dio dio = Dio();
//   // CancelToken cancelToken = CancelToken();
//   void setDioConfiguration() async {
//     dio.interceptors.clear();
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (request, handler) {
//           if (token != null && token != '') {
//
//             request.headers['Authorization'] = 'Bearer $token';
//           }
//
//           return handler.next(request);
//         },
//       ),
//     );
//     dio.options.connectTimeout=const Duration(seconds: 15);
//     dio.options.receiveTimeout=const Duration(seconds: 15);
//     dio.options.baseUrl = ApiKeys.baseUrl;
//     dio.options.contentType = 'application/json';
//     dio.options.headers = {'Accept': 'Application/json'};
//   }
// }
