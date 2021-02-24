import 'package:awesomity_challenge/providers/task_provider.dart';
import 'package:awesomity_challenge/screens/landing.dart';
import 'package:awesomity_challenge/screens/task_form.dart';
import 'package:awesomity_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context)
                .textTheme
                .apply(
                    bodyColor: Constants.PRIMARY_COLOR,
                    displayColor: Constants.PRIMARY_COLOR)
                .copyWith(
                  headline1: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Constants.PRIMARY_COLOR,
                  ),
              subtitle1: TextStyle(fontSize: 11.9,color: Constants.PRIMARY_LIGHT_COLOR)
                ),
          ),
          scaffoldBackgroundColor: Constants.LIGHT_COLOR,
          primaryColor: Constants.PRIMARY_COLOR,
          accentColor: Constants.PRIMARY_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(),
        routes: {
          TaskFormScreen.routeName:(_)=> TaskFormScreen()
        },
      ),
    );
  }
}
