import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/task_remote_repository.dart';
import '../../domain/entities/task.dart';

final taskControllerProvider =
    StateNotifierProvider<TaskController, AsyncValue<List<Task>>>(
  (ref) => TaskController(ref.read(taskRepositoryProvider)),
);

class TaskController extends StateNotifier<AsyncValue<List<Task>>> {
  TaskController(this._repository) : super(const AsyncValue.loading()) {
    loadTasks();
  }

  final TaskRemoteRepository _repository;

  Future<void> loadTasks() async {
    try {
      final tasks = await _repository.getTasks();
      state = AsyncValue.data(tasks);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
