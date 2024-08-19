import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/services/connectivity_service/connectivity_service.dart';
import 'data/services/settings_service.dart';
import 'data/services/translation_service.dart';
import 'start_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectivityController(), permanent: true);
  Get.put(SettingsService(), permanent: true);
  Get.put(TranslationService(), permanent: true);
  runApp(const StartApp());
}


