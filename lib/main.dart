import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sibersozluk/widgets/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// void main() => runApp(ChangeNotifierProvider(
//     create: (context) => BookmarkBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta OzCe',
      theme: ThemeData(),
      home: Navigation(
        t1: '',
        t2: '',
      ),
    );
  }
}
