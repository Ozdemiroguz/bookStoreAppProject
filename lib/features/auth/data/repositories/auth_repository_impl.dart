import 'dart:developer';
import 'package:book_store/constants/api_endpoints.dart';
import 'package:book_store/core/models/failure/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  AuthRepositoryImpl(
      {required this.networkService, required this.localeResourcesService,});

  @override
  Future<bool> isTokenExpired() async {
    localeResourcesService.deleteAccessToken();
   
    final token = await localeResourcesService.getAccessToken();

    if (token.isNone()) return true;

    final isExpired = JwtDecoder.isExpired(token.toNullable()!);

    if (isExpired) {
      await localeResourcesService.clearSecureStorage();
    } else {
      log(token.toNullable() ?? "Token is null");
      networkService.setToken(token.toNullable()!);
    }

    return isExpired;
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    final response = await networkService.post(
      Endpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    // Handle the response using Either fold
    return response.fold(
      (failure) => left(failure),
      (successResponse) {
        final token = successResponse.data!['action_login']['token'].toString();

        log("token: $token");


        

        return right(unit); // Unit represents successful completion
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> register(
      String name, String email, String password,) async {
    final response = await networkService.post(
      Endpoints.register, // Update endpoint for registration
      data: {
        'email': email,
        'name': name,
        'password': password,
      },
    );

    return response.fold(
      (failure) => left(failure),
      (successResponse) {
        final token = successResponse.data!['action_register']['token'];
        log("token: $token");

        // Handle successful registration (optional)
        // - Extract token (if applicable)

        log("Registration successful!");
        return right(unit); // Unit represents successful completion
      },
    );
  }
}
