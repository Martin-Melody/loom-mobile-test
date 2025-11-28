import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  return const AppConfig(
    apiBaseUrl: "http://localhost:5184/api",
    apiKey: "password",
  );
});

class AppConfig {
  final String apiBaseUrl;
  final String apiKey;

  const AppConfig({
    required this.apiBaseUrl,
    required this.apiKey,
  });
}
