import 'package:flutter/foundation.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  UserViewModel(this.userRepository);

  List<User> users = [];
  bool isLoading = false;

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      users = await userRepository.fetchUsers();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
