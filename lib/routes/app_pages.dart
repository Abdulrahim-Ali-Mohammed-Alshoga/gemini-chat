import 'package:gemini_chat_app/modules/home/view/home_view.dart';
import 'package:get/get.dart';

import '../modules/home/binding/home_binding.dart';


class AppPages {
  // static const String initial = SplashView.route;

  static const String initial = HomeView.route;

  static const transition = Transition.cupertinoDialog;
  static const duration = Duration(milliseconds: 500);

  static final List<GetPage> allRoutes = [
    GetPage(
      name: HomeView.route,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

  ];
}
