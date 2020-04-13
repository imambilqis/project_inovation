import 'dart:async';
import 'package:dio/dio.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_inovation/core/models/tms_model.dart';
import 'package:project_inovation/resources/api.dart';

class TMSBloc extends FormBloc<String, String> {
  final API api = API();
  final emailField = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );
  final passwordField = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );

  final isRememberMe = BooleanFieldBloc();

  TMSBloc() {
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
    final storage = await SharedPreferences.getInstance();}
}