import 'package:flutter/material.dart';
import 'package:lost_app/my_app.dart';
import 'package:lost_app/presentations/route/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(
      appRoutes: AppRouter(),
    ),
  );
}
