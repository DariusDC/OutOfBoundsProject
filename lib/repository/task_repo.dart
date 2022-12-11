import 'package:out_of_bounds/model/task/task.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/networking/retrofit_controller.dart';

class TaskRepo {
  final RetrofitController _retrofitController;

  TaskRepo({RetrofitController? retrofitController})
      : _retrofitController = retrofitController ?? RetrofitController();

  Stream<UIModel<List<Task>>> getTasks() async* {
    yield UIModel.loading();

    try {
      final client = _retrofitController.taskClient();
      final result = await client.fetchTasks();
      yield UIModel.success(result);
    } catch (e) {
      yield UIModel.error(e);
    }
  }

  Stream<UIModel<bool>> updateTask(Task task) async* {
    yield UIModel.loading();

    try {
      final client = _retrofitController.taskClient();
      final result = await client.updateTask(task);
      yield UIModel.success(true);
    } catch (e) {
      yield UIModel.error(e);
    }
  }
}
