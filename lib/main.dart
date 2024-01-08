import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tigor_store/core/database/cache/cache_helper.dart';
import 'package:tigor_store/core/routes/app_router.dart';
import 'package:tigor_store/core/services/service_locator.dart';
import 'package:tigor_store/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const CameoStore());
}

class CameoStore extends StatelessWidget {
  const CameoStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}