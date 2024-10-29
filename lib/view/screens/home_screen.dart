import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewmodels/user_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Consumer<UserViewModel>(
        builder: (context, userViewModel, child) {
          if (userViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userViewModel.users.isEmpty) {
            return Center(child: Text('No users found.'));
          }

          return ListView.builder(
            itemCount: userViewModel.users.length,
            itemBuilder: (context, index) {
              final user = userViewModel.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserViewModel>(context, listen: false).fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
