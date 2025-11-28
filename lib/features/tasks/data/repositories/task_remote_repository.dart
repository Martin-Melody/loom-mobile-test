import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/dio_client.dart';
import '../../domain/entities/task.dart';

final taskRepositoryProvider = Provider<TaskRemoteRepository>((ref) {
  final dio = ref.watch(dioClientProvider);
  return TaskRemoteRepository(dio);
});

class TaskRemoteRepository {
  final Dio _dio;
  TaskRemoteRepository(this._dio);

  Future<List<Task>> getTasks() async {
    final response = await _dio.get('/tasks');
    final list = response.data as List<dynamic>;
    return list.map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
  }
}
