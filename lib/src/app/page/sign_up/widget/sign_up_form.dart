import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_up/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _name;
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
              'Nome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'seu nome',
              ),
              validator: (nome) => nome.isEmpty ? 'Campo Obrigatório' : null,
              onChanged: (nome) => _name = nome,
            ),
            SizedBox(height: 16),
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
                    context.bloc<SignUpCubit>().signUpUser(
                          name: _name,
                          email: _email,
                          password: _password,
                        );
                  }
                },
                child: Text(
                  'Cadastrar',
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
