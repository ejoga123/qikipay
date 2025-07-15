import 'package:flutter/material.dart';
import '../../services/notification_service.dart';
import '../../models/notification_model.dart';
import '../../widgets/notification_tile.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    // Replace with actual fetch logic from Firestore or local DB
    await Future.delayed(const Duration(seconds: 1)); // Simulated delay
    setState(() {
      notifications = [
        NotificationModel(
          id: 'n1',
          title: 'Top-up Successful',
          body: '₦5,000 has been added to your wallet.',
          type: 'transaction',
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          isRead: false,
        ),
        NotificationModel(
          id: 'n2',
          title: 'Promo Alert!',
          body: 'Get 10% cashback on your next transfer.',
          type: 'promo',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          isRead: true,
        ),
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
              ? const Center(child: Text('No notifications yet'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationTile(notification: notifications[index]);
                  },
                ),
    );
  }
}
