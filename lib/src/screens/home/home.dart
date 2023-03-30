import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Body(),
      ),
    );
  }
}
