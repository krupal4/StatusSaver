import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:status_saver/main.dart';

void main() {
  testWidgets('app loads the home shell', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    expect(find.byType(MaterialApp), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
