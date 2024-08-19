import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'helpers_method.dart';

class BaseController extends GetxController {
  HelpersMethods helpersMethods = HelpersMethods();
  static final GlobalKey<ScaffoldState> _tabScreenScaffoldKey =
      GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get tabScreenScaffoldKey => _tabScreenScaffoldKey;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  GlobalKey<FormBuilderState> get formKey {
    return _formKey;
  }

  AutovalidateMode? _autoValidateMode;
  AutovalidateMode get autoValidateMode =>
      _autoValidateMode ?? AutovalidateMode.disabled;
  set autoValidateMode(AutovalidateMode autoValidateMode) {
    _autoValidateMode = autoValidateMode;
    update();
  }

  ///.....
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value, {bool notify = true}) {
    if (value && _showRetryButton) {
      _showRetryButton = false;
    }
    _busy = value;
    if (notify) {
      update();
    }
  }

  ///CurrentUserData
  // AuthService get authService => Get.find<AuthService>();

  //retry setting;
  bool _showRetryButton = false;

  bool get showRetryButton => _showRetryButton;
}
