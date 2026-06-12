import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:group_flutter_android_demo/main.dart';

void main() {
  testWidgets('innovation team device demo renders main sections', (tester) async {
    await tester.pumpWidget(const InnovationTeamDeviceApp());

    expect(find.text('创新实验第15周'), findsOneWidget);
    expect(find.text('Flutter Android 真机验收看板'), findsOneWidget);
    expect(find.text('小组成员与 PR 分工'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('Android 真机运行检查项'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('最终证据要求'), findsOneWidget);
  });
}
