import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../size_config.dart';
import 'components/body_home.dart';
import 'components/select_all_favorited_digimon.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
          child: const Text('Digimon Wiki'),
        ),
        centerTitle: true,
      ),
      body: const BodyHome(),
      floatingActionButton: const SelectAllFavoritedDigimonIcon(),
    );
  }
}
