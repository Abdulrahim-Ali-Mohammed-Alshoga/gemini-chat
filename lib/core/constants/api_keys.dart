class ApiKeys {
  ApiKeys._();

  /// base url
  static const String baseUrl = 'https://mobileapp.osaned.com:2014/';
  // http://dev2.osaned.com:9091/
  /// main branches
  static const String _api = 'api/';
  static const String _userUrl = '${_api}auth/';
  static const String _bi = '${_api}bi/';
  static const String _workflow = 'v1/api/workflow/';
  static const String report = '${_api}report/';
  static const String purchase = '${_api}purchase/';
  static const String receive = '${_api}GRN/';

  /// user
  static const String login = '${_userUrl}login';
  static const String purchaseCount = '${purchase}count';
  static const String purchaseAll = '${purchase}find-all';
  static const String items = '$purchase:orderNo/items/find-all';
  static const String bulkReceiving = receive;

  ///putaway

  static const String getProfile = '${_userUrl}profile';
  static const String resetPassword = _userUrl + 'reset-password';
  static const String updatePassword = _userUrl + 'update-password';
  static const String changePassword = _userUrl + 'change-password';
  static const String checkResetToken = _userUrl + 'check-reset-token';

  /// list
  static const String putaway = '${_api}putaway';

  /// devices
  static const String getChangeDeviceReasons = _bi + 'list-reasons';
  static const String changeDeviceRequest = _bi + 'request-change';

  /// hierarchy
  static const String getHierarchyData = _bi + 'get-data';

  /// superList
}
