import 'package:cafe_menu/Features/home/presentation/widgets/serch_bar.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Theme/app_palette.dart';


class SearchBarRow extends StatelessWidget {
  const SearchBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                AppPalette.darkShadeBlack.withOpacity(0.3), AppPalette.darkShadeBlack.withOpacity(0.5)
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                //Search Box
                child: CustomSearchBar()),
          ),
        ),

        //Filter Icon
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  AppPalette.darkShadeBlack.withOpacity(0.3), AppPalette.darkShadeBlack.withOpacity(0.6)
                ]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 3)),
                ]),
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppPalette.primaryBackgroundColor,
              weight: 30,
            ),
          ),
        ),
      ],
    );
  }
}
