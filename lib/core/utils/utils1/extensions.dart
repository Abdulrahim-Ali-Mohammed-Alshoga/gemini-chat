import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

extension ListExtension<T> on List<T> {
  T get randomElement => this[Random().nextInt(length)];
}
extension StringExtension on String {
  Color get statusColor {
    switch (this) {
      case 'free':
        return AppColors.statusBlue;
      case 'cost':
        return AppColors.statusBlue;
      case 'complete':
        return AppColors.statusGreen;
      case 'release':
        return AppColors.statusGray;
      case 'close':
        return AppColors.statusGray;
      case 'reject':
        return AppColors.statusRed;
      case 'cancel':
        return AppColors.statusRed;
      default:
        return AppColors.statusGray;
    }
  }
}
extension NonNullString on String? {
  String get orEmpty {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }

  String get orEmptyData {
    if (this == null || this!.isEmpty) {
      return '0000';
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZeo() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
