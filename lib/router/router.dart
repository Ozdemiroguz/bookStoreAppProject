import 'package:auto_route/auto_route.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/home/presentation/pages/book_page.dart';
import '../features/home/presentation/pages/category_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/intro/presentation/pages/intro_page.dart';
import '../features/home/domain/models/book_category.dart';
import '../features/home/domain/models/book.dart';

import '../splash_page.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget|Tab,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        // Initial route
        AutoRoute(page: SplashRoute.page, initial: true),

        // Authentication routes
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),

        // Intro route
        AutoRoute(page: IntroRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoryRoute.page),
        AutoRoute(page: BookRoute.page),

        
      ];
}
