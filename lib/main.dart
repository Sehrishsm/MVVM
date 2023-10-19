import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/utills/routes/routes.dart';
import 'package:untitled1/utills/routes/routes_name.dart';
import 'package:untitled1/view/login_view.dart';
import 'package:untitled1/view_model/auth_view_modal.dart';
import 'package:untitled1/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModal()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

