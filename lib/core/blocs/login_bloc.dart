import 'dart:async';
import 'package:dio/dio.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_inovation/core/models/login_model.dart';
import 'package:project_inovation/resources/api.dart';

class LoginBloc extends FormBloc<String, String> {
  final API api = API();
  final emailField = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );
  final passwordField = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );

  final isRememberMe = BooleanFieldBloc();

  LoginBloc() {
    prefillFields();
  }

  void dispose() {
    emailField.close();
    passwordField.close();
    isRememberMe.close();
  }

  void prefillFields() async {
    final storage = await SharedPreferences.getInstance();

    emailField.updateInitialValue(storage.getString('username'));
    passwordField.updateInitialValue(storage.get('password'));
    isRememberMe.updateInitialValue(storage.getBool('isRememberMe'));
  }

  @override
  List<FieldBloc> get fieldBlocs => [emailField, passwordField, isRememberMe];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    final storage = await SharedPreferences.getInstance();
    try {
      PostLoginModel body = PostLoginModel(
        username: emailField.value,
        password: passwordField.value,
      );
      var response = await api.loginAPI(body).timeout(
            Duration(seconds: 10),
          );
      if (!response.data.toString().contains('Error')) {
        if (isRememberMe.value) {
          await storage.setString('username', emailField.value);
          await storage.setString('password', passwordField.value);
        }

        await storage.setBool('isLogin', true);
        await storage.setBool('isRememberMe', isRememberMe.value);
      }

      yield !response.data.toString().contains('Error')
          ? state.toSuccess('Sukses Login')
          : state.toFailure('Username / Password Salah');
    } on DioError catch (_) {
      yield state.toFailure('Koneksi bermasalah');
    } on TimeoutException catch (_) {
      yield state.toFailure('Gagal menyambung ke server');
    }
  }
}
