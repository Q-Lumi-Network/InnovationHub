import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qs_app/bloc/auth_bloc.dart';
import 'package:qs_app/screens/authenticate/sign_in.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final AuthService _auth = AuthService();
  void Logout() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.logOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('QS Crew'),
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            onPressed: () async {
              Logout();
              //await _auth.UsersignOut();
            },
          ),
        ],
      ),
    );
  }
}
