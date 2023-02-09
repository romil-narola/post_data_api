import 'package:dio/dio.dart';

class Repo {
  static Future<dynamic> postData(name, phoneno, rollno, course) async {
    dynamic response = Dio().post("http://192.168.1.11:8000/api/addstudent/",
        data: {
          "name": name,
          "phone": phoneno,
          "roll": rollno,
          "course": course
        });
    return response;
  }
}
