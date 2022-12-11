import 'package:dio/dio.dart';
import 'package:out_of_bounds/model/task/task.dart';
import 'package:retrofit/http.dart';

part 'task_client.g.dart';

@RestApi()
abstract class TaskClient {
  factory TaskClient(Dio dio, {String baseUrl}) = _TaskClient;

  @GET("/task")
  Future<List<Task>> fetchTasks();

  @PATCH("/task")
  Future<dynamic> updateTask(@Body() Task task);
}
