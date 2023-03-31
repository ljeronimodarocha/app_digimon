import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/digimon_provider.dart';

class SelectAllFavoritedDigimonIcon extends StatefulWidget {
  const SelectAllFavoritedDigimonIcon({
    super.key,
  });

  @override
  State<SelectAllFavoritedDigimonIcon> createState() =>
      _SelectAllFavoritedDigimonIconState();
}

class _SelectAllFavoritedDigimonIconState
    extends State<SelectAllFavoritedDigimonIcon> {
  @override
  Widget build(BuildContext context) {
    bool isSelectedFavorited =
        Provider.of<DigimonProvider>(context).isselectedFavoriteList;

    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            Provider.of<DigimonProvider>(context, listen: false)
                .changeFavoritedList();
          });
        },
        child: CircleAvatar(
          backgroundColor: Colors.black54,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Center(
                child: Icon(Icons.star, color: Colors.black, size: 50.0),
              ),
              Center(
                  child: Icon(Icons.star,
                      color: isSelectedFavorited ? Colors.yellow : Colors.white,
                      size: 40.0))
            ],
          ),
        ),
      ),
    );
  }
}
