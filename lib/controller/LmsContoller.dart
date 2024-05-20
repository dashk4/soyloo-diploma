import 'dart:convert';
import 'dart:io';
import 'package:diploma/constants/values.dart';
import 'package:diploma/models/login_model.dart';
import 'package:diploma/models/my_post_model.dart';
import 'package:diploma/models/posts_model.dart';
import 'package:diploma/models/user_model.dart';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwZTViMDQ4NS00N2NkLTRmNzMtODhkNC02NmVkZDM4ZGJlY2IiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzEzNjMzOTY0LCJleHAiOjE3MTUxMDUxOTN9.Yl5gAvlMDRM9bAtgxB8X9XyhfhlNSpgsQpWLDVV4kWw";
String accessToken = "";
Future<dynamic> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print('apiUrl ${apiUrl}/api/auth/login');

    print("~RESPONSE LOGIN ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = UserModel.fromJson(jsonDecode(response.body));
      accessToken = data.accessToken;
      return data;
    } else {
      print('u poor');
      throw Exception('Failed to login');
    }
  } on SocketException catch (_) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу.");
  } catch (e) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу.");
  }
}

Future<dynamic> signup(String email, String password, String phone) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        "phone": phone,
      }),
    );
    print('apiUrl ${apiUrl}/api/users');

    print("~RESPONSE LOGIN ${response.statusCode}");

    if (response.statusCode == 201) {
      return print("Success");
    } else {
      print('u poor');
      throw Exception('Failed to login');
    }
  } on SocketException catch (_) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу.");
  } catch (e) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу.");
  }
}

Future<List<PostsModel>> getPosts(
  double maxArea,
  int maxPrice,
  double minArea,
  int minPrice,
  int page,
  String searchPattern,
  int size,
) async {
  final response = await http.get(
    Uri.parse(
        '$apiUrl/api/posts?maxArea=$maxArea&maxPrice=$maxPrice&minArea=$minArea&minPrice=$minPrice&page=$page&searchPattern=$searchPattern&size=$size'),
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );
  print("~getPostsData ${response.body}");
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> content = jsonData['content'];
    List<PostsModel> posts = content.map((json) => PostsModel.fromJson(json)).toList();
    return posts;
  } else {
    throw Exception('Failed');
  }
}

Future<PostsModel> getPost(String id) async {
  final response = await http.get(
    Uri.parse('$apiUrl/api/posts/$id'),
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );
  print("~post data ${response.body}");
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return PostsModel.fromJson(jsonData);
  } else {
    throw Exception('Failed');
  }
}

Future<dynamic> addPost(String address, int area, String descrition, int postType, int price, int rooms, String title, int roomNumber) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/api/posts'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "address": address,
        "area": area,
        "description": descrition,
        "postImages": [
          {
            "id": 0,
            "image": "string",
            "post": {
              "address": "string",
              "area": 0,
              "createdDate": "2024-04-24T14:58:06.165Z",
              "description": "string",
              "id": "string",
              "modifiedDate": "2024-04-24T14:58:06.165Z",
              "postImages": [null],
              "postTypes": ["POST_PLACE"],
              "price": 0,
              "rooms": 0,
              "title": "string",
              "user": {
                "active": true,
                "createdDate": "2024-04-24T14:58:06.165Z",
                "email": "string",
                "firstname": "string",
                "id": "string",
                "lastname": "string",
                "modifiedDate": "2024-04-24T14:58:06.165Z",
                "password": "string",
                "phone": "string",
                "posts": [null],
                "roles": ["ROLE_USER"]
              }
            },
            "poster": true
          }
        ],
        "postType": postType,
        "price": price,
        "roomNumber": roomNumber,
        "rooms": rooms,
        "title": title
      }),
    );

    print("~RESPONSE LOGIN ${response.statusCode}");

    if (response.statusCode == 201) {
      return print('Success');
    } else {
      print('u poor');
      throw Exception('Failed ');
    }
  } on SocketException catch (_) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу.");
  } catch (e) {
    throw Exception("Та түр хүлээгээд дахин оролдно уу. $e");
  }
}

Future<List<MyPostModel>> getMyPost(String id, String text) async {
  final response = await http.get(
    Uri.parse('http://localhost:8081/api/users/$id/posts?page=0&searchPattern=$text&size=100'),
    headers: {
      'Authorization': 'Bearer $accessToken',
    },
  );
  print("~getMyPost data ${response.body}");
  if (response.statusCode == 200) {
    // Map<String, dynamic> jsonData = json.decode(response.body);
    // return MyPostModel.fromJson(jsonData);

    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> content = jsonData['content'];
    List<MyPostModel> posts = content.map((json) => MyPostModel.fromJson(json)).toList();
    return posts;
  } else {
    throw Exception('Failed');
  }
}
