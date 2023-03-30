import 'package:flutter/material.dart';
import 'package:qs_app/screens/authenticate/sign_in.dart';
import 'package:qs_app/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:qs_app/screens/home/home.dart';

import '../../shared/constants.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  

  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Register with Email and Password
  dynamic registerNewUser() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    dynamic result = authBloc.registerWithEmailPassword (email, password);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }


  //Text field state
  String email = '';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Signup to QS Crew'),
       actions: <Widget> [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            style: TextButton.styleFrom(
                primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn(),
        ),
              );
            },
          )
        ]
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey, 
            child: Column(
              children: <Widget> [
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Kindly enter an email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val!.length < 8 ? 'Kindly a passoword 8+ characters long' : null,
                  onChanged: (val){
                    setState(() => password = val );
                  },
                ),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[400],
                    padding: EdgeInsets.zero,
                  ), 
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white60),
                  ),
                  onPressed: () async{
                    
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                     registerNewUser();
                     dynamic result = await registerNewUser();
                        if (result == null) {
                          setState(() {
                            error = 'invalid email/password';
                            loading = false;
                          });
                        }
                    }
                  }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ]
            )
          )

          ),
    );
  }
}