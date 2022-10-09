import 'package:dio/dio.dart' hide Headers;
import 'package:get/get.dart' as getx;
import 'package:magic_sign/app/pages/dash_board/controllers/dash_board_controller.dart';
import 'package:magic_sign/data/models/course.dart';
import 'package:retrofit/http.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: 'https://musketeer-api.tk/api/v1')
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  @GET('/courses')
  Future<List<Course>> getCourses();

}