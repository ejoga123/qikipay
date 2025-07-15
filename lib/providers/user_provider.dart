import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isAuthenticated = false;

  UserModel? get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  void login(UserModel userData) {
    _user = userData;
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _user = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  void updateProfile(UserModel updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }

  void toggleAuth(bool status) {
    _isAuthenticated = status;
    notifyListeners();
  }
}
