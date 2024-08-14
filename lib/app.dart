import 'package:admin_app_real_estate/provider/index_provider.dart';
import 'package:admin_app_real_estate/provider/properties_provider.dart';
import 'package:admin_app_real_estate/provider/user_provider.dart';
import 'package:admin_app_real_estate/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PropertiesProvider()),
      ],
      child: MaterialApp(
        title: 'Real Estate Admin App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        initialRoute: '/lockScreen',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
