import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? _userModel;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        setState(() {
          _error = 'No user logged in';
          _isLoading = false;
        });
        return;
      }
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      if (!doc.exists) {
        setState(() {
          _error = 'User data not found';
          _isLoading = false;
        });
        return;
      }
      final userData = doc.data()!;
      setState(() {
        _userModel = UserModel.fromJson(userData);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load user data';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _userModel == null
            ? const Center(child: Text('No user data available'))
            : ListView(
                children: [
                  if (_userModel!.profileImage != null &&
                      _userModel!.profileImage!.isNotEmpty)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_userModel!.profileImage!),
                    )
                  else
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    _userModel!.displayName ??
                        '${_userModel!.firstName ?? ''} ${_userModel!.sureName ?? ''}'
                            .trim(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _userModel!.email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(_userModel!.phoneNumber ?? 'Not provided'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(_userModel!.address ?? 'Not provided'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet),
                    title: Text(
                        'Balance: ₦${_userModel!.balance.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(
                        'Member since: ${_userModel!.createdAt != null ? _userModel!.createdAt!.toLocal().toString().split(' ').first : 'Unknown'}'),
                  ),
                ],
              ),
      ),
    );
  }
}
