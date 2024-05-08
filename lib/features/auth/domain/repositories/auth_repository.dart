import 'package:book_store/core/models/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<bool> isTokenExpired();
  Future<Either<Failure, Unit>> login(String email, String password);
  Future<Either<Failure, Unit>> register(
      String name, String email, String password,);
}
