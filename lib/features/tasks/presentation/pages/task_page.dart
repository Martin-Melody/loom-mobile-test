import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/task_controller.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Loom Tasks")),
      body: tasks.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) => CheckboxListTile(
            title: Text(items[i].title),
            value: items[i].completed,
            onChanged: (_) {
              // toggle logic
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text("Error loading tasks")),
      ),
    );
  }
}
