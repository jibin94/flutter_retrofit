// lib/api/api_service.dart

import 'package:flutter_retrofit/models/post.dart';
import 'package:flutter_retrofit/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/users")
  Future<List<User>> getUsers();

  @POST("/posts")
  Future<Post> createPost(@Body() Post post);
}
