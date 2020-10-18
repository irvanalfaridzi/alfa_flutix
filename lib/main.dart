import 'package:alfa_flutix/bloc/theme_bloc.dart';
import 'package:alfa_flutix/bloc/user_bloc.dart';
import 'package:alfa_flutix/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // asli code
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc()),
            BlocProvider(create: (_) => UserBloc()),
            BlocProvider(create: (_) => ThemeBloc()),
            BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()))),
    );

    // coba signup
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           RaisedButton(
    //               child: Text("Sign Up"),
    //               onPressed: () async {
    //                 SignInSignUpResult result = await AuthServices.signUp(
    //                     "coba@gmail.com",
    //                     "123456",
    //                     "Irvan Alfaridzi",
    //                     ["Action", "Horror", "Music", "Drama"],
    //                     "Korean");

    //                     if (result.user == null) {
    //                       print(result.message);
    //                     } else {
    //                       print(result.user.toString());
    //                     }

    //               })
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
