// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../core/values/app_images.dart';
// import '../../core/values/launguages_and_localization/app_strings.dart';
// import '../ui_helpers.dart';
//
// class ImagePickerWidgetForm extends StatefulWidget {
//   final double height;
//   final double width;
//   final double radiusCircular;
//   final AlignmentGeometry alignmentGeometry;
//   final Widget image;
//   final Widget iconClick;
//   final String keyName;
//   final bool isRequired;
//   final Function upLoudImage;
//   final bool isUploaded;
//
//   const ImagePickerWidgetForm({
//     Key? key,
//     required this.height,
//     required this.width,
//     required this.radiusCircular,
//     required this.alignmentGeometry,
//     required this.image,
//     required this.keyName,
//     required this.isRequired,
//     required this.upLoudImage,
//     required this.iconClick,
//     required this.isUploaded,
//   }) : super(key: key);
//
//   @override
//   _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
// }
//
// class _ImagePickerWidgetState extends State<ImagePickerWidgetForm> {
//   File? storedIma;
//   File? savedIma;
//
//   /* Future<bool?> _imageSourceDialog(BuildContext context, dynamic field) async {
//     final size = MediaQuery.of(context).size;
//     return showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         title: Text(
//           AppStrings.pickImage.tr.capitalizeFirst!,
//           textAlign: TextAlign.center,
//         ),
//         content: Container(
//           height: size.height * 0.22,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () => _takePicture(ImageSource.camera, field),
//                     child: Wrap(
//                       direction: Axis.vertical,
//                       children: [
//                         Image.asset(AppImages.camera,
//                             width: 50.w, height: 50.h),
//                         SizedBox(height: 10.h),
//                         Text(AppStrings.camera.tr.capitalizeFirst!),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => _takePicture(ImageSource.gallery, field),
//                     child: Wrap(
//                       direction: Axis.vertical,
//                       children: [
//                         Image.asset(AppImages.gallery,
//                             width: 50.w, height: 50.h),
//                         SizedBox(height: 10.h),
//                         Text(AppStrings.gallery.tr.capitalizeFirst!),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.h),
//               CupertinoButton(
//                   padding: const EdgeInsets.all(0),
//                   child: Container(
//                     height: 40.h,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Get.theme.colorScheme.secondary,
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: Text(
//                       AppStrings.cancel.tr.capitalizeFirst!,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   onPressed: () => Navigator.of(context).pop()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// */
//   Future<bool?> _newImageSourceDialog(
//       BuildContext context, dynamic field) async {
//     final size = MediaQuery.of(context).size;
//     return showDialog(
//       builder: (context) => Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: EdgeInsets.symmetric(vertical: size.height * 0.27),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(bottom: 20.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40.r),
//                   color: Get.theme.colorScheme.secondary),
//               padding: EdgeInsets.fromLTRB(35.w, 25.h, 35.w, 20.h),
//               child: Column(
//                 children: [
//                   Text(
//                     'Pick Image',
//                     style: Get.textTheme.subtitle1?.copyWith(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   UiHelper.verticalSpaceLarge,
//                   GestureDetector(
//                     onTap: () => _takePicture(ImageSource.camera, field),
//                     child: Column(
//                       children: [
//                         Image.asset(AppImages.camera,
//                             width: 50.w, height: 50.h),
//                         SizedBox(height: 8.h),
//                         Text(
//                           AppStrings.camera.tr.capitalizeFirst!,
//                           style: Get.textTheme.bodyText2?.copyWith(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   GestureDetector(
//                     onTap: () => _takePicture(ImageSource.gallery, field),
//                     child: Column(
//                       children: [
//                         Image.asset(AppImages.gallery,
//                             width: 50.w, height: 50.h),
//                         SizedBox(height: 8.h),
//                         Text(
//                           AppStrings.gallery.tr.capitalizeFirst!,
//                           style: Get.textTheme.bodyText2?.copyWith(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () => Navigator.of(context).pop(),
//               overlayColor: MaterialStateProperty.all(Colors.transparent),
//               highlightColor: Colors.transparent,
//               child: Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.blue, shape: BoxShape.circle),
//                 child: Icon(
//                   Icons.keyboard_arrow_left_outlined,
//                   size: 50.r,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       context: context,
//     );
//   }
//
//   Future<void> _takePicture(ImageSource source, dynamic field) async {
//     final picker = ImagePicker();
//
//     final imageFile = await picker.pickImage(
//       source: source,
//       maxWidth: 600,
//     );
//     if (imageFile == null) return;
//
//     storedIma = File(imageFile.path);
//
//     field.didChange(storedIma);
//
//     /// delete the next two lines
//     Get.back();
//     setState(() {});
//     savedIma = File(imageFile.path);
//     uploadImage();
//   }
//
//   /*void _startAddNewTransaction(BuildContext ctx, dynamic field) {
//     showModalBottomSheet(
//         context: ctx,
//         builder: (_) {
//           return Container(
//             padding: const EdgeInsets.all(0),
//             color: Get.theme.primaryColor,
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                   leading: Icon(
//                     Icons.camera_enhance,
//                     color: Get.textTheme.bodyText1?.color,
//                   ),
//                   title: Text(
//                     AppStrings.camera.tr.capitalizeFirst!,
//                     style: Get.textTheme.bodyText1,
//                   ),
//                   onTap: () => _takePicture(ImageSource.camera, field),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.image,
//                     color: Get.textTheme.bodyText1?.color,
//                   ),
//                   title: Text(
//                     AppStrings.gallery.tr.capitalizeFirst!,
//                     style: Get.textTheme.bodyText1,
//                   ),
//                   onTap: () => _takePicture(ImageSource.gallery, field),
//                 )
//               ],
//             ),
//           );
//         });
//   }*/
//
//   bool loadingImage = false;
//   bool newImage = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderField(
//       name: widget.keyName,
//       validator: FormBuilderValidators.compose([
//         if (widget.isRequired) FormBuilderValidators.required(),
//       ]),
//       builder: (FormFieldState<dynamic> field) {
//         return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               storedIma == null
//                   ? widget.image.paddingOnly(bottom: 15.h)
//                   : Container(
//                       width: 100.w,
//                       height: 100.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: FileImage(
//                             storedIma!,
//                           ),
//                         ),
//                       ),
//                     ).paddingOnly(bottom: 10.h),
//               Visibility(
//                 visible: loadingImage,
//                 child: const SpinKitSpinningLines(
//                   color: Colors.white,
//                   size: 80.0,
//                 ),
//               )
//             ],
//           ),
//           Align(
//               alignment: widget.alignmentGeometry,
//               //Alignment.bottomLeft,
//               child: InkWell(
//                   onTap: () => _newImageSourceDialog(context, field),
//                   child: widget.iconClick)),
//         ]);
//       },
//     );
//   }
//
//   void uploadImage() async {
//     setState(() {
//       loadingImage = true;
//     });
//     newImage = await widget.upLoudImage(storedIma);
//     if (!newImage) storedIma = null;
//     setState(() {
//       loadingImage = false;
//     });
//   }
// }
