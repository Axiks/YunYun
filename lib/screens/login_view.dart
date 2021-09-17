import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yunyun_flutter_app/auth/auth_repository.dart';
import 'package:yunyun_flutter_app/auth/form_submission_status.dart';
import 'package:yunyun_flutter_app/auth/login/login_bloc.dart';
import 'package:yunyun_flutter_app/auth/login/login_event.dart';
import 'package:yunyun_flutter_app/auth/login/login_state.dart';

class LoginView extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
            authRepo: context.read<AuthRepository>()
        ),
        child: _loginForm(context),
      ),
    );
  }

  Widget _loginForm(BuildContext context){

    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if(formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }
    },
    child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 48),
              _usernameField(),
              SizedBox(height: 24),
              _passwordField(),
              _forgoutPassword(context),
              SizedBox(height: 24),
              Center(
                  child: _loginButton()
              ),
              SizedBox(height: 24),
              _loginWitch(),
              Center(
                  child: _singUp(context)
              )
            ],
          ),
        )),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Username',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          TextFormField(
            obscureText: true,
            validator: (value) => state.isValidUsername ? null : 'Username is too short',
            onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username: value)
            ),
          ),
        ],
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Password',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          TextFormField(
            obscureText: true,
            validator: (value) => state.isValidPassword ? null : "Password is too short",
            onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value)
            ),
          ),
        ],
      );
    });
  }

  Widget _forgoutPassword(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        TextButton(
          onPressed: () {
            print("Forgout Password button press");
          },
          child: Text(
            'Forgout password?',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ]
    );
  }

  Widget _loginButton(){
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
      : ElevatedButton(
          onPressed: () {
            //print(_formKey.currentState?.validate().toString());
            if(_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginSubmitted());
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
            child: Text(
                'Login',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      );
    });
  }

  Widget _loginWitch(){
    return Column(
      children: [
        Text("or login witch"),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("Google SingUp");
              },
              child: Icon(
                FontAwesomeIcons.google,
                size: 36,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                print("Facebook SingUp");
              },
              child: Icon(
                FontAwesomeIcons.facebookF,
                size: 36,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _singUp(BuildContext context){
    return TextButton(
      onPressed: () {
        print("SIGN UP button press");
      },
      child: Text(
        'Don`t have acount? SIGN UP',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}