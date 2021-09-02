import 'package:flutter/material.dart';

import 'widgets/buildNavbarWidget.dart';
import 'widgets/buildPagesWidget.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: buildPagesWidget(),
      ),
      bottomNavigationBar: buildNavbarWidget(),
    );
  }
}
