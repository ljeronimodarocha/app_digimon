// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_digimon/src/models/digimon.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class IconIsFavorited extends StatefulWidget {
  final Digimon digimon;
  const IconIsFavorited({
    Key? key,
    required this.digimon,
  }) : super(key: key);

  @override
  State<IconIsFavorited> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<IconIsFavorited> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();

    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: GestureDetector(
        onTap: () async {
          await homeController.favoritedDigimon(widget.digimon);
          setState(() {});
        },
        child: FutureBuilder<bool>(
          future: homeController.digimonIsFavoriteByName(widget.digimon.name),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data == true
                  ? Stack(
                      alignment: Alignment.center,
                      children: const [
                        Center(
                          child:
                              Icon(Icons.star, color: Colors.black, size: 50.0),
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
                          child:
                              Icon(Icons.star, color: Colors.black, size: 50.0),
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
    );
  }
}
