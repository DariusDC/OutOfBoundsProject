import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/screens/login/login_screen.dart';
import 'package:out_of_bounds/utils/toast_utils.dart';
import 'package:out_of_bounds/widgets/subscription_state.dart';

abstract class BaseRequestScreen<T extends StatefulWidget>
    extends SubscriptionState<T> {
  int _noOfLoadingRequests = 0;
  bool _isDefaultSysNavBar = true;

  bool get loading => _noOfLoadingRequests > 0;

  void fetchData<E>(
    Stream<UIModel<E>> stream, {
    required Function(E) handleValue,
    Function(Object?)? handleError,
    VoidCallback? handleLoading,
    bool withLoading = true,
  }) {
    disposeLater(stream.listen((data) {
      setState(() {
        switch (data.state) {
          case OperationState.loading:
            if (withLoading) _noOfLoadingRequests++;
            if (handleLoading != null) handleLoading();
            break;
          case OperationState.ok:
            if (withLoading) _noOfLoadingRequests--;
            handleValue(data.data!);
            break;
          case OperationState.error:
            if (withLoading) _noOfLoadingRequests--;
            if (data.error is DioError) {
              if ((data.error as DioError).response?.statusCode ==
                  HttpStatus.forbidden) {
                redirectToLogin();
              } else {
                _handleError(data.error, handleError);
              }
            } else {
              _handleError(data.error, handleError);
            }
            break;
        }
      });
    }));
  }

  void _handleError(Object? error, Function(Object?)? handleError) {
    if (handleError != null) {
      handleError(error);
    } else {
      showToast(error);
    }
  }

  void changeSysNavBarColor() {
    _isDefaultSysNavBar = false;
  }

  void showToast(Object? error) {
    if (error is DioError) {
      print(error);
    }
  }

  SystemUiOverlayStyle get sysNavBarValue {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: _isDefaultSysNavBar
          ? null
          : Theme.of(context).scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          _isDefaultSysNavBar ? null : Brightness.dark,
    );
  }

  void redirectToLogin() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
