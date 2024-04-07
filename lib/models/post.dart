import 'package:dantia/models/user.dart';

class Post {
  final User user;
  final String text;
  final String imageUrl;
  final DateTime timestamp;

  Post({
    required this.user,
    required this.text,
    required this.imageUrl,
    required this.timestamp,
  });
}
