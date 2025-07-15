import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;

  void setNotifications(List<NotificationModel> list) {
    _notifications = list;
    notifyListeners();
  }

  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification); // Add to top
    notifyListeners();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      notifyListeners();
    }
  }

  void removeNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();

    // TODO: Replace with actual fetch logic
    await Future.delayed(const Duration(seconds: 1));
    _notifications = [
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

    _isLoading = false;
    notifyListeners();
  }
}
