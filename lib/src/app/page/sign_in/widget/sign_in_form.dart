import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/app/page/home/home_page.dart';
import 'package:richme/src/core/cubit/sign_in/sign_in_cubit.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
    with SingleTickerProviderStateMixin {
  String _email;
  String _password;
  AnimationController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (_, state) {
        if (state is StartedSignInAnimation) {
          _controller.forward();
        }
        if (state is SignInSuccess) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        }
      },
      child: Form(
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
                  hintText: 'Digite aqui o seu email...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                validator: (email) =>
                    email.isEmpty ? 'Campo Obrigatório' : null,
                onChanged: (email) => _email = email,
              ),
              SizedBox(height: 16),
              Text(
                'Senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digite aqui sua senha...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                obscureText: true,
                validator: (password) =>
                    password.isEmpty ? 'Campo Obrigatório' : null,
                onChanged: (password) => _password = password,
              ),
              SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 600 - (500 * _controller.value),
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
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (_, state) {
                        if (state is StartedSignInAnimation) {
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          );
                        } else {
                          return Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
