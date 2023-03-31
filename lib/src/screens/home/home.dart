import 'package:app_digimon/src/providers/digimon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import '../../../size_config.dart';
import 'components/body_home.dart';
import 'components/select_all_favorited_digimon.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowResize() async {
    setState(() async {
      await Provider.of<DigimonProvider>(context, listen: false).loadDigimons();
    });
  }

  @override
  void onWindowEnterFullScreen() async {
    setState(() async {
      await Provider.of<DigimonProvider>(context, listen: false).loadDigimons();
    });
  }

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
