import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../models/digimon.dart';
import 'icon_is_favorited.dart';

class DialogImage extends StatefulWidget {
  const DialogImage({
    super.key,
    required this.digimon,
  });

  final Digimon digimon;

  @override
  State<DialogImage> createState() => _DialogImageState();
}

class _DialogImageState extends State<DialogImage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenWidth(12),
              left: getProportionateScreenWidth(12)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              const Spacer(),
              Image.network(widget.digimon.image),
              const Spacer(),
              IconIsFavorited(digimon: widget.digimon),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
