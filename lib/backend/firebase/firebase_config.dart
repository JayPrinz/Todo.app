import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAynnwH39bZ6lMFiOWm7naKk7iJkJttNao",
            authDomain: "to-do-app-8h0250.firebaseapp.com",
            projectId: "to-do-app-8h0250",
            storageBucket: "to-do-app-8h0250.appspot.com",
            messagingSenderId: "982035317425",
            appId: "1:982035317425:web:451b9cf4e9d20cc3245890"));
  } else {
    await Firebase.initializeApp();
  }
}
