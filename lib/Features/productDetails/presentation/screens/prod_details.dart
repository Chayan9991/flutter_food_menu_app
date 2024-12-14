import 'package:cafe_menu/Features/cart/presentation/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../Core/Config/Routes/app_routes.dart';
import '../../../../Core/Theme/app_palette.dart';

class ProdDetails extends StatefulWidget {
  final Map<String, dynamic> item;

  const ProdDetails({super.key, required this.item});

  @override
  State<ProdDetails> createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
  int orderQuantity = 0; // For tracking order quantity
  String userNote = ""; // For user custom notes
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    // Use default values in case of null entries
    final item = widget.item;
    final String name = item["name"] ?? "Unnamed Product";
    final String image = item["image"] ??
        "https://via.placeholder.com/200"; // Placeholder image for missing URLs
    final String description =
        item["description"] ?? "No description available.";
    final List<String> allergens = item["allergens"] ?? ["None"];
    final double price = item["price"]?.toDouble() ?? 0.0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppPalette.primaryBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppPalette.primaryBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.add_shopping_cart_outlined))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ProductImageContainer(image),
              const SizedBox(height: 20),

              // Product Name and Price
              Text(
                name,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                item["category"]!,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Container(
                width: 68,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.yellow.shade900,
                    ),
                    Text(
                      item["rating"],
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    Text(
                      "(244)",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black12,
              ),

              // Product Description
              const Text(
                "Description",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 5,
              ),
              ReadMoreText(
                description,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
                trimMode: TrimMode.Line,
                trimLines: 1,
                trimCollapsedText: "Read More",
                trimExpandedText: ' Show less',
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.tealGreen),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.tealGreen),
              ),
              const SizedBox(height: 10),

              // Allergens Section
              const Text(
                "Allergens:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: allergens
                    .map((allergen) => Chip(
                          label: Text(
                            allergen,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          backgroundColor: Colors.red.withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 12),

              // Customization Notes
              const Text(
                "Add a Note (Optional):",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 4,
                minLines: 2,
                decoration: InputDecoration(
                  hintText: "E.g., No sugar, extra spicy...",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    userNote = value;
                  });
                },
              ),
              const SizedBox(height: 10),

              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Order Quantity:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      // Decrease Button
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (orderQuantity > 0) {
                              orderQuantity--;
                              isAddedToCart = false;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                        color: Colors.red,
                        iconSize: 28,
                      ),
                      // Quantity Display
                      Text(
                        "$orderQuantity",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Increase Button
                      IconButton(
                        onPressed: () {
                          setState(() {
                            orderQuantity++;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.green,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Add to Cart Button
              AddToCartBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProductImageContainer(String image) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget AddToCartBtn() {
    return Container(
      decoration: isAddedToCart
          ? BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff858484), Color(0xff0c0c0c)],
                // Light Green to Dark Green
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(
              gradient: orderQuantity > 0
                  ? const LinearGradient(
                      colors: [Color(0xff0c9e9a), Color(0xff0a4d4a)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
              borderRadius: BorderRadius.circular(10),
            ),
      child: ElevatedButton(
        onPressed: orderQuantity > 0
            ? () {
                // Logic to add to cart
                setState(() {
                  isAddedToCart = true;
                });
              }
            : null, // Disabled if quantity is 0
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: isAddedToCart
              ? GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, Cart());
                  },
                  child: Text(
                    "Go to Cart",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: orderQuantity > 0
                          ? Colors.white
                          : Colors.black54, // Adjust text color
                    ),
                  ),
                )
              : Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: orderQuantity > 0
                        ? Colors.white
                        : Colors.black54, // Adjust text color
                  ),
                ),
        ),
      ),
    );
  }
}
