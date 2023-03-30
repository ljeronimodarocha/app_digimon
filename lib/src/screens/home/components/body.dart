import 'package:app_digimon/src/models/digimon.dart';
import 'package:app_digimon/src/providers/digimon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';
import 'card_digimon.dart';
import 'dialog_image.dart';
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
              const inputFind(),
              const ListPokemons(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListPokemons extends StatefulWidget {
  const ListPokemons({
    super.key,
  });

  @override
  State<ListPokemons> createState() => _ListPokemonsState();
}

class _ListPokemonsState extends State<ListPokemons> {
  List<Digimon> listDigimons = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
        child: SizedBox(
          height: getProportionateScreenWidth(400),
          width: getProportionateScreenWidth(300),
          child: FutureBuilder(
            future: Provider.of<DigimonProvider>(context, listen: false)
                .loadDigimons(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.error != null) {
                return const Center(
                  child: Text("Ocorreu um erro!"),
                );
              } else {
                return Consumer<DigimonProvider>(
                  builder: (ctx, provider, child) {
                    return RefreshIndicator(
                      onRefresh: () {
                        Provider.of<DigimonProvider>(context, listen: false);
                        setState(() {});
                        return Future.value();
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.digimons.length,
                        itemBuilder: (ctx, index) =>
                            CardDigimon(provider.digimons[index]),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
