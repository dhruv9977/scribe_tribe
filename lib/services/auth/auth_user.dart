import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

@immutable
class AuthUser {
  const AuthUser();

  factory AuthUser.fromFirebase(User user) => const AuthUser();
}
