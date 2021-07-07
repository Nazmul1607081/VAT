import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vatapp/model/key.dart';

class MyKeyService {
  FirebaseDatabase database = FirebaseDatabase();

  MyKeyService() {
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  Stream<MyKey> get user {
    database
        .reference()
        .child('key')
        .onValue
        .map((event) => event.snapshot.hashCode);
  }
}
