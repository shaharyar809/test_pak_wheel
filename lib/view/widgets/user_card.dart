import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';
// import '../../data/models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
