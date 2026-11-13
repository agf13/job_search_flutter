import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_search/core/database/app_database.dart';
import 'package:job_search/core/providers.dart';
import 'package:job_search/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('renders the job search workspace and accepts keywords', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const DevJobsApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Find work that fits you.'), findsOneWidget);
    expect(find.text('STRICT MATCH'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'Pastry chef');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('Pastry chef'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await database.close();
  });
}
