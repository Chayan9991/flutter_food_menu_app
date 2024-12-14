import 'package:cafe_menu/Features/home/data/home_item_data.dart';
import 'package:cafe_menu/Features/home/presentation/widgets/home_card.dart';
import 'package:cafe_menu/Features/home/presentation/widgets/search_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Core/Theme/app_palette.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.teal.shade800,
                Colors.tealAccent.shade700
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
              child: Column(
                children: [
                  AppBar(
                    toolbarHeight: 60,
                    backgroundColor: Colors.transparent,
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "South Avenue, Kolkata ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.gps_fixed,
                              size: 10,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                    // actions: [
                    //   Padding(
                    //     padding: const EdgeInsets.only(right: 20),
                    //     child: Container(
                    //       height: 30,
                    //       width: 30,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: Colors.white30,
                    //       ),
                    //       child: const Icon(
                    //         Icons.more_vert,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   )
                    // ],
                  ),

                  //Search box row
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBarRow()),
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Category List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  //color: Colors.red,
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex ==
                          index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: 70,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppPalette.darkShadeBlack.withOpacity(0.8)
                                : Colors.transparent,
                            // Set background color based on selection
                            borderRadius: BorderRadius.circular(10),
                            border: isSelected
                                ? null
                                : Border.all(color: Colors.black26),
                          ),
                          child: Center(
                            child: Text(
                              categories[index]["name"]!, // Category name
                              style: TextStyle(
                                  color: isSelected
                                      ? AppPalette.primaryBackgroundColor
                                      : AppPalette.darkShadeBlack,
                                  // Set text color based on selection
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),


              // List of Items
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 0,
                    childAspectRatio: 3.2/ 4,
                  ),
                  itemCount: items[categories[selectedIndex]["name"]]!.length,
                  itemBuilder: (context, index) {
                    final item =
                        items[categories[selectedIndex]["name"]]![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HomeCard(item: item),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
