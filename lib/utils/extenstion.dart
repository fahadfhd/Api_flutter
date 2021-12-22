import 'package:flutter/material.dart';
import 'package:students/providers/base_provider.dart';
import 'package:students/utils/exceptions.dart';

extension StringExtension on String {
  String asAssetjpeg() => 'assets/images/$this.jpeg';
  String asAssetpng() => 'assets/images/$this.png';
}

extension FutureExtension<T> on Future<T> {
  Future<T> handleAPIException({
    // required void Function(
    //         {required APIException apiException,
    //         required OnShowError onShowError,
    //         VoidCallback? onInvaliedToken,
    //         VoidCallback? onInvaliedTokenListener})
    //     handleAPIException,
    required Function handleAPIException,
    required OnShowError onShowError,
    VoidCallback? onInvaliedTokenListener,
  }) {
    return catchError((ex) {
      handleAPIException(
        apiException: ex,
        onShowError: onShowError,
      );
    }, test: (ex) => ex is APIException).catchError((ex) {
      onShowError(ex.toString(), false);
    });
  }
}
