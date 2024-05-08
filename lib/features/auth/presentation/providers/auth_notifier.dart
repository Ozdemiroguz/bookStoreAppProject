import 'package:book_store/core/injections/locator.dart';
import 'package:book_store/features/auth/domain/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthState {
  initial,
  loading,
  authenticated,
  error,
}

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier(this.authRepository) : super(AuthState.initial);
  AuthState get currentState => state;

  Future<void> signIn(String username, String password) async {
    state = AuthState.loading;

    final result = await authRepository.login(username, password);


    result.fold(
      (failure) {
        state = AuthState.error;
      },
      (_) {
        state = AuthState.authenticated;
      },
    );
  }

  Future<void> signUp(String name, String username, String password) async {
    state = AuthState.loading;

    final result = await authRepository.register(name, username, password);

    result.fold(
      (failure) {
        state = AuthState.error;
      },
      (_) {
        state = AuthState.authenticated;
        
      },
    );
  }

  void logout() {
    state = AuthState.initial;
    // (Optional) Call any necessary methods to clear tokens or user data locally
  }
}
