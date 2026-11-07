import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appmessage/main.dart';

void main() {
  testWidgets(
    'Pressing the button displays and updates the predefined message',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify initial text and single button are displayed.
      expect(find.text('Press the button below.'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Show Message'), findsOneWidget);

      // Tap the button once and verify the predefined message appears.
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Press the button below.'), findsNothing);
      expect(find.text('Hello! You pressed the button.'), findsOneWidget);

      // Tap the button again and verify the message changes.
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Hello! You pressed the button.'), findsNothing);
      expect(find.text('Welcome to your mobile app!'), findsOneWidget);
    },
  );
}
