import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/app/page/sign_in/sign_in_page.dart';
import 'package:richme/src/app/page/sign_up/widget/sign_up_form.dart';
import 'package:richme/src/core/cubit/sign_up/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.15 * MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: Text(
                      'Registrar',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 0.85 * MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Column(
                      children: [
                        Container(
                          height: 500,
                          child: SignUpForm(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Já tem uma conta?'),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => SignInPage(),
                                ),
                              ),
                              child: Text(
                                'Entrar!',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
