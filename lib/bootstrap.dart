import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'constants/system_ui_overlay_styles.dart';
import 'core/injections/locator.dart';
import 'utils/http_overrides.dart';

String appVersion = '';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await EasyLocalization.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayDarkStyle);
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      await configureDependencies();

      HttpOverrides.global = MyHttpOverrides();

      await SentryFlutter.init(
        (options) {
          options.dsn = 'https://3b2c6fbf29164da89d5e2761df212588@thoth.piton.com.tr/33';

          options.tracesSampleRate = 1.0;
          options.sendDefaultPii = true;
          options.maxRequestBodySize = MaxRequestBodySize.small;
          options.maxResponseBodySize = MaxResponseBodySize.small;
        },
      );

      appVersion = (await PackageInfo.fromPlatform()).version;

      runApp(
        DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: ProviderScope(
            child: await builder(),
          ),
        ),
      );
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
