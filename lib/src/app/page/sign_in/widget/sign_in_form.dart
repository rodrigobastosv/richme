import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_in/sign_in_cubit.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 42,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'seuemail.com',
              ),
              validator: (email) => email.isEmpty ? 'Campo Obrigatório' : null,
              onChanged: (email) => _email = email,
            ),
            SizedBox(height: 16),
            Text(
              'Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'sua senha secreta',
              ),
              obscureText: true,
              validator: (password) =>
                  password.isEmpty ? 'Campo Obrigatório' : null,
              onChanged: (password) => _password = password,
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 600,
              height: 50,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    context.bloc<SignInCubit>().signInUser(
                          email: _email,
                          password: _password,
                        );
                  }
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
