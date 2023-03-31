import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../size_config.dart';
import '../../../models/digimon.dart';
import '../../../providers/digimon_provider.dart';
import 'card_digimon.dart';

class ListDigimons extends StatefulWidget {
  const ListDigimons({
    super.key,
  });

  @override
  State<ListDigimons> createState() => _ListPokemonsState();
}

class _ListPokemonsState extends State<ListDigimons> {
  List<Digimon> listDigimons = [];

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
