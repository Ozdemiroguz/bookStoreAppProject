import 'package:book_store/core/injections/locator.config.dart';
import 'package:book_store/features/home/domain/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../router/router.dart';
import '../../services/locale/locale_resources_service.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() => getIt.init();

final appRouterProvider = Provider.autoDispose((ref) => getIt<AppRouter>());

final localeResourcesServiceProvider = Provider.autoDispose((ref) => getIt<LocaleResourcesService>());

final authRepositoryProvider = Provider.autoDispose((ref) => getIt<AuthRepository>());

final homeRepositoryProvider = Provider.autoDispose((ref) => getIt<HomeRepository>());
