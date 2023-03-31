import 'package:flutter/material.dart';

import '../../../models/digimon.dart';
import '../../../../size_config.dart';
import 'dialog_image.dart';

class CardDigimon extends StatelessWidget {
  final Digimon digimon;
  const CardDigimon(this.digimon, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(130),
      child: GestureDetector(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (_) => DialogImage(digimon: digimon),
          );
        },
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: ListTile(
                    title: Text(
                      'Nome: ${digimon.name}',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(17),
                      ),
                    ),
                    subtitle: Text(
                      'Nível: ${digimon.level}',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(130),
                  child: Image.network(
                    digimon.image,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
