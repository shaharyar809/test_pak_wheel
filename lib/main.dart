import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'viewmodel/viewmodels/user_view_model.dart';
import 'core/services/api_service.dart';
import 'data/repositories/user_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(UserRepository(ApiService())),
        ),
      ],
      child: MyApp(),
    ),
  );
}
