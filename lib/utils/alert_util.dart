import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showSuccessAlert(
    BuildContext context, String message, Function? onConfirm) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: onConfirm!());
}

void showErrorAlert(BuildContext context, String message, Function? onConfirm) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
      onConfirmBtnTap: onConfirm!());
}


void showConfirmAlert(BuildContext context, String message, Function? onConfirm) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: message,
      onConfirmBtnTap: onConfirm!());
}