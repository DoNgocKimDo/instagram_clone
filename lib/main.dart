import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/sign_up_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAdxjSwb_qJX2jboC_0hNMpm3Y_Ex7aqUk",
            projectId: "instagram-clone-1ae1f",
            storageBucket: "instagram-clone-1ae1f.appspot.com",
            messagingSenderId: "1021021805036",
            appId: "1:1021021805036:web:e89694a7a2e51c5df1c8c9"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileResponsive: MobileLayout(),
      //   webResponsive: WebLayout(),
      //    )
      home: const SignUpScreen(),
    );
  }
}
