import 'package:app_digimon/src/screens/home/components/list_digimon.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'find_input.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        child: Expanded(
          child: Column(
            children: [
              Image.asset(
                width: SizeConfig.screenWidth * 0.7,
                'assets/banner_digimon.jpg',
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              const InputFind(),
              const ListDigimons(),
            ],
          ),
        ),
      ),
    );
  }
}
