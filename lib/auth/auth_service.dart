import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Supabase.instance.client;

  Future<AuthResponse> login(String email, String password) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  void logout() {
    _client.auth.signOut();
  }

  String? currentEmail() {
    return _client.auth.currentUser?.email;
  }
}
