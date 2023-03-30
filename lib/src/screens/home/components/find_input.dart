import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/digimon_provider.dart';
import '../../../../size_config.dart';

class inputFind extends StatelessWidget {
  const inputFind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(260),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Procure Digimon desejado",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onChanged: (value) {
            Provider.of<DigimonProvider>(context, listen: false)
                .filterDigimon(value.toLowerCase());
          },
        ),
      ),
    );
  }
}
