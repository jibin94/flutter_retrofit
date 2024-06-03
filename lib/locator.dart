
import 'package:dio/dio.dart';
import 'package:flutter_retrofit/api/api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiService>(() => ApiService(locator<Dio>()));
}