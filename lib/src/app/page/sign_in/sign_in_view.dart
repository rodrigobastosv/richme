import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richme/src/app/page/sign_in/widget/sign_in_form.dart';
import 'package:richme/src/app/page/sign_up/sign_up_page.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.green,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.30 * MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Container(
                  height: 0.65 * MediaQuery.of(context).size.height,
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
                          height: 400,
                          child: SignInForm(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ainda não tem uma conta?'),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (_) => SignUpPage(),
                                ),
                              ),
                              child: Text(
                                'Crie!',
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
