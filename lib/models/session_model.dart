// // To parse this JSON data, do
// //
// //     final session = sessionFromJson(jsonString);

// import 'dart:convert';

// Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

// String sessionToJson(Session data) => json.encode(data.toJson());

// class Session {
//   Session({
//     this.status,
//     this.message,
//     this.token,
//   });

//   bool status;
//   String message;
//   String token;

//   factory Session.fromJson(Map<String, dynamic> json) => Session(
//         status: json["status"],
//         message: json["message"],
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "token": token,
//       };
// }
/////////////////////////
///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class Session {
/*
{
  "status": true,
  "message": "Login Successfully",
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGl0cG9vZGxlLmNvbVwvIiwiYXVkIjoiaHR0cHM6XC9cL2xpdHBvb2RsZS5jb21cLyIsImlhdCI6MTY1MjI2Nzc5NSwibmJmIjoxNjUyMjY3ODI1LCJleHAiOjE2NTIyNjc4NTUsImRhdGEiOnsiZW1haWwiOiJzYW5nYXJAdGFnd2Vicy5pbiIsInVzZXJfaWQiOiIxODQxODIiLCJwYXNzd29yZCI6InNhbmdhciJ9fQ.X89YfelNoIWzZf6W3p1wHnkbG3OARNHB3BC2WcAsjQc"
} 
*/

  bool status;
  String message;
  String token;

  Session({
    this.status,
    this.message,
    this.token,
  });
  Session.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    token = json['token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}