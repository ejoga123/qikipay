import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  final List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  void setNotifications(List<NotificationModel> list) {
    _notifications.clear();
    _notifications.addAll(list);
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

  void clearAll() {
    _notifications.clear();
    notifyListeners();
  }

  int get unreadCount => _notifications.where((n) => !n.isRead).length;
}
