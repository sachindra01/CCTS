
import 'package:ccts/src/presentation/web_ui/view/dashboard_web/dashboard_page.dart';
import 'package:flutter/material.dart';

class SamplePgae extends StatefulWidget {
  const SamplePgae({super.key});

  @override
  State<SamplePgae> createState() => _SamplePgaeState();
}

class _SamplePgaeState extends State<SamplePgae> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage(
      route: 'samplePage',
      body: Container(

      ),
    );
  }
}