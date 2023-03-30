import 'package:app_digimon/src/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/digimon.dart';
import '../../../../size_config.dart';

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
  var homeController = HomeController();

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
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: GestureDetector(
                  onTap: () async {
                    await homeController.favoritedDigimon(widget.digimon);
                    setState(() {});
                  },
                  child: FutureBuilder<bool>(
                    future: homeController
                        .digimonIsFavoriteByName(widget.digimon.name),
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data == true
                            ? Stack(
                                alignment: Alignment.center,
                                children: const [
                                  Center(
                                    child: Icon(Icons.star,
                                        color: Colors.black, size: 50.0),
                                  ),
                                  Center(
                                      child: Icon(Icons.star,
                                          color: Colors.yellow, size: 40.0))
                                ],
                              )
                            : Stack(
                                alignment: Alignment.center,
                                children: const [
                                  Center(
                                    child: Icon(Icons.star,
                                        color: Colors.black, size: 50.0),
                                  ),
                                  Center(
                                      child: Icon(Icons.star,
                                          color: Colors.white, size: 40.0))
                                ],
                              );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
