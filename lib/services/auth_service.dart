import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Expose current user safely
  User? get currentUser => _auth.currentUser;

  /// Sign up new user
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint("Signup error: $e");
      return null;
    }
  }

  /// Sign up new user with profile data
  Future<User?> registerWithEmailAndProfile(
    String email,
    String password,
    String firstName,
    String sureName,
    String phoneNumber,
    String address,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'firstName': firstName,
          'sureName': sureName,
          'phoneNumber': phoneNumber,
          'address': address,
          'createdAt': DateTime.now().toIso8601String(),
          'balance': 0.0,
        });
      }
      return user;
    } catch (e) {
      debugPrint("Signup with profile error: $e");
      return null;
    }
  }

  /// Log in existing user
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint("Login error: $e");
      return null;
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint("Password reset error: $e");
      rethrow;
    }
  }

  /// Sign out user
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// Watch auth status stream
  Stream<User?> get userStream => _auth.authStateChanges();
}
