import 'package:flutter/material.dart';
import 'package:grocery/core/routing/generated_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery/core/services/get_it_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouteGenerator.mainRoutingInOurApp,
    );
  }
}
