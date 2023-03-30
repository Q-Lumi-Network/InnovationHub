import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qs_app/bloc/auth_bloc.dart';
import 'package:qs_app/screens/authenticate/register.dart';
import 'package:qs_app/screens/home/home.dart';
import 'package:qs_app/shared/constants.dart';

import '../../shared/loading.dart';

//import '../home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //late StreamSubscription<User?>? loginStateSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

// Anonymous Login
  void anonLogin() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    var result = authBloc.signInAnonymously();

    if (result != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

// Login with Email and Password
  dynamic emailAndPasswordLogin() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    dynamic result = authBloc.signInWithEmailPassword(email, password);
    return result;
  }

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          title: Text('QS Night Crew'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
            )
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>
                      val!.isEmpty ? 'Kindly enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val!.length < 8
                      ? 'Kindly a passoword 8+ characters long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.green[400]),
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white60),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        // emailAndPasswordLogin();
                        dynamic result = await emailAndPasswordLogin();
                        if (result == null) {
                          setState(() {
                            error = 'invalid credentials';
                            loading = false;
                          });
                            
                        } else
                          (Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          ));
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ]))),
    );
  }
}


// ElevatedButton(
//             child: Text('Sign in anonymously'),
//             onPressed: () async {
//               anonLogin();
//               // if (result == null) {
//               //   print('error signing in');
//               //   }
//               //   else {
//               //     print('signed in');
//               //     print(result.uid);

//               //   }
//             },
//           )),