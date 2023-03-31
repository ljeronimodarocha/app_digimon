import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'body.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Body(),
      ),
    );
  }
}
