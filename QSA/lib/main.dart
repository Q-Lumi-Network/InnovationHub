import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qs_app/bloc/auth_bloc.dart';
import 'package:qs_app/models/user.dart';
import 'package:qs_app/screens/authenticate/sign_in.dart';
import 'package:qs_app/screens/home/home.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Provider(
          create: (context) => AuthBloc(),
          child: const MaterialApp(
            title: 'QS Crew',
            home: SignIn(),
            //theme: AppTheme(context).darkTheme,
            debugShowCheckedModeBanner: false,
            //initialRoute: RouteGenerator.splash,
            //onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qs_app/models/user.dart';
// import 'package:qs_app/screens/wrapper.dart';
// import 'package:qs_app/services/auth.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return StreamProvider<MyUser?>.value(
//       value: AuthService().user,
//            initialData: null,
//            child: MaterialApp(
        
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: Wrapper(),
//       ),
//     );
//   }
// }
