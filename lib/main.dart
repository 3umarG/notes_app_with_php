import 'package:flutter/material.dart';
import 'package:notes_app_with_php/core/routes/app_router.dart';
import 'package:notes_app_with_php/core/service_locator/sl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
