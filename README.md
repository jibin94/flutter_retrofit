## Plugins used

`dio` : Used as the HTTP client for making network requests.
`retrofit` : Simplifies the process of defining API endpoints using annotations. It generates the necessary code for making HTTP requests using `retrofit_generator` and `build_runner`.
`json_annotation` and `json_serializable` work together to generate the code for serializing and deserializing JSON data to and from Dart objects.
`get_it` is used for dependency injection, allowing you to manage your dependencies efficiently and make your code more modular and testable.

## Retrofit

**Method parameters:**
In Retrofit, method parameters allow you to define the types of requests you want to make and how to send data along with those requests. Here's an overview of the different types of method parameters you can use in Retrofit for Flutter:

`@GET`: This annotation is used for GET requests to retrieve data from the server.
`@POST`: This annotation is used for POST requests to send data to the server.
`@PUT`: This annotation is used for PUT requests to update existing data on the server.
`@DELETE`: This annotation is used for DELETE requests to remove data from the server.
`@PATCH`: This annotation is used for PATCH requests to partially update existing data on the server.

**Annotations:**
`@Path`: This annotation is used to replace a part of the URL with the given parameter. It is often used for specifying resource IDs.
`@GET("/users/{id}")
Future<User> getUser(@Path("id") int userId);`
In this example, {id} in the URL will be replaced with the value of userId.

`@Query`: This annotation is used to add query parameters to the URL.
`@GET("/users")
Future<List<User>> getUsers(@Query("page") int page, @Query("limit") int limit);`
This will result in a URL like /users?page=1&limit=10.

`@Body`: This annotation is used to send a request body with POST, PUT, or PATCH requests.
`@POST("/users")
Future<User> createUser(@Body() User user);`
The User object will be converted to JSON and sent as the request body.

`@Headers`- This annotation is used to specify HTTP headers that should be added to a request. These headers are static and defined at compile time. If you need dynamic headers (headers that can change at runtime), you should use the `@Header` parameter annotation.
**Static Headers**
Static headers are defined using the @Headers annotation at the method level. These headers are fixed and will be included in every request made by the annotated method.
`@Headers(<String, dynamic>{
"Content-Type": "application/json",
"Accept": "application/json"
})
@POST("/posts")
Future<Post> createPost(@Body() Post post);`

**Dynamic Headers**
Dynamic headers are defined using the @Header parameter annotation. This allows you to specify headers at runtime, which can be different for each request.
`@POST("/posts")
Future<Post> createPost(
@Body() Post post,
@Header("Authorization") String authorization
);`

**Samples**
`@GET("/posts")
Future<List<Post>> getPosts(@Header("Content-Type") String contentType );`

`@GET("/comments")
@Headers(<String, dynamic>{ //Static header
"Content-Type" : "application/json",
"Custom-Header" : "Your header"
})
Future<List<Comment>> getAllComments();`

`@GET("/posts/{id}")
Future<Post> getPostFromId(@Path("id") int postId);`

`@GET("/comments?postId={id}")
Future<Comment> getCommentFromPostId(@Path("id") int postId);`

`@GET("/comments")
Future<Comment> getCommentFromPostIdWithQuery(@Query("postId") int postId); //This yields to "/comments?postId=postId`

`@DELETE("/posts/{id}")
Future<void> deletePost(@Path("id") int postId);`

`@POST("/posts")
Future<Post> createPost(@Body() Post post);`
