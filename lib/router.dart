import 'package:go_router/go_router.dart';
import 'features/tasks/presentation/pages/task_page.dart';

final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (_, __) => const TasksPage())],
);
