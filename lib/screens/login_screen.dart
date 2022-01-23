import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sparrow_news_app/blocs/login_bloc/login_bloc.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';
import 'package:sparrow_news_app/utils/routes.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloc _loginBloc;
  LoginScreen({Key? key})
      : _loginBloc = LoginBloc(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _loginBloc,
        listener: _listener,
        child: Center(
          child: BlocBuilder(bloc: _loginBloc, builder: _builder),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, LoginState state) {
    if (state is LoginLoadingState) {
      return const CircularProgressIndicator();
    }
    return ElevatedButton(
      onPressed: () => _loginBloc.add(LoginAnonymouslyEvent()),
      child: const Text(AppStrings.signInAnonymously),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginSuccessfulState) {
      Navigator.popAndPushNamed(context, AppRoutes.newsFeedRoute);
    } else if (state is LoginFailureState) {
      showAlert(context, state.message);
    }
  }

  void showAlert(BuildContext context, String message) {
    Alert(
      context: context,
      type: AlertType.error,
      title: AppStrings.oops,
      desc: message,
      buttons: [
        DialogButton(
          child: const Text(
            AppStrings.okay,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
