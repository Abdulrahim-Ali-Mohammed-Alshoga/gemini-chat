// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:get/get.dart' as g;
// import '../../../core/values/launguages_and_localization/app_strings.dart';
//
// extension HandleResoponse on Future<Response<dynamic>> {
//   Future mapFromResponse(Function(Map<String, dynamic>) jsonParser) async {
//     try {
//       final response = await this;
//       return jsonParser(response.data);
//     }
//     /*on SocketException {
//       return 'Internet connection error';
//     }*/ /*on TypeError {
//       return 'Data type error';
//     }*/
//     catch (e) {
//       return handleError(error: e);
//     }
//   }
// }
//
// /// process methods
// // handleError({required error}) {
// //   if (error is DioException ) {
// //     if (error.type == DioExceptionType.badResponse) {
// //       if (error.response == null) {
// //         return AppStrings.errorsInConnection.tr.capitalizeFirst!;
// //       } else if (error.response?.statusCode == 401) {
// //         return error.response?.data['message'] ??
// //             AppStrings.serverError.tr.capitalizeFirst!;
// //         } else if ((error.response?.statusCode ?? 500) >= 500) {
// //         return AppStrings.internalServerError.tr.capitalizeFirst!;
// //       } else if (error.response?.statusCode == 404) {
// //         return AppStrings.notFound.tr.capitalizeFirst!;
// //       } else if (error.response!.data is Map<String, dynamic>) {
// //         return GeneralResponseModel.fromMap(
// //           map: error.response!.data,
// //         );
// //       } else {
// //         return AppStrings.serverError.tr.capitalizeFirst!;
// //       }
// //     } else {
// //       return AppStrings.internetConnectionError.tr.capitalizeFirst!;
// //     }
// //   } else {
// //     return AppStrings.errorsInConnection.tr.capitalizeFirst!;
// //   }
// // }
// // handleError({required error,required Function a}) {
// //   String message = serverFailure(error: error);
// //   DifferentDialogs.hideProgressDialog();
// //   if(error.type!=DioExceptionType.connectionTimeout)
// //   {
// //     g.Get.showSnackbar(
// //       DifferentDialogs.errorSnackBar(
// //         message: message,
// //       ),
// //     );
// //   }
// // }
//
// handleError({ required error}) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return "Connection Timeout with the Server. Internet connection error";
//     case DioExceptionType.sendTimeout:
//       return "Sending Timeout with the Server";
//     case DioExceptionType.receiveTimeout:
//       return "Receiving Timeout with the Server";
//     case DioExceptionType.connectionError:
//       return fromResponse(error.response?.statusCode, error.response?.data);
//     case DioExceptionType.cancel:
//       return 'Request to ApiServer was canceled';
//     case DioExceptionType.badResponse:
//       return fromResponse(error.response?.statusCode, error.response?.data);
//     case DioExceptionType.unknown:
//       if (error.error is SocketException) {
//         return 'Unknown';
//       }
//       return 'Unexpected Error, Please try again!';
//
//     default:
//       return 'Oops! There was an Error, Please try again';
//   }
// }
//
// fromResponse(int? statusCode, dynamic response) {
//   if (response == null) {
//     return AppStrings.errorsInConnection.tr.capitalizeFirst!;
//   } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//     final errorMessage = response['message'] as String? ?? 'Unknown Error';
//     return errorMessage;
//   } else if (statusCode == 404) {
//     return 'Your request was not found, Please try again later!';
//   } else if ((statusCode ?? 500) >= 500) {
//     return 'Internal Server Error, Please try again later';
//   } else {
//     return 'Oops! There was an Error, Please try again';
//   }
// }
