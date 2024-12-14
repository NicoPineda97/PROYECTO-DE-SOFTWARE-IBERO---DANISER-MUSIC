import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC4OjUfkmOMJOZ3reGeD2W5UQs4P-O1Zyo",
            authDomain: "daniser-music-6aadd.firebaseapp.com",
            projectId: "daniser-music-6aadd",
            storageBucket: "daniser-music-6aadd.appspot.com",
            messagingSenderId: "956582854562",
            appId: "1:956582854562:web:328130ccb700128535fcfb"));
  } else {
    await Firebase.initializeApp();
  }
}
