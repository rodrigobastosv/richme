import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_up/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with SingleTickerProviderStateMixin {
  String _name;
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
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (_, state) {
        if (state is StartedSignUpAnimation) {
          _controller.forward();
        }
        if (state is SignUpSuccess) {
          Navigator.of(context).pop();
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
                'Nome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digite aqui seu nome...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
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
                  hintText: 'Digite aqui seu email...',
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
              SizedBox(height: 16),
              Text(
                'Confirmação da senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digite aqui a confirmação da sua senha...',
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
                        context.bloc<SignUpCubit>().signUpUser(
                              name: _name,
                              email: _email,
                              password: _password,
                            );
                      }
                    },
                    child: BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (_, state) {
                      if (state is StartedSignUpAnimation) {
                        return CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        );
                      } else {
                        return Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }
                    }),
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
