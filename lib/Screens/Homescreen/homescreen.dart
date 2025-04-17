import 'package:e_commerce/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  final categories = [
    {'assetPath': 'assets/images/footwear.png', 'label': 'Footwear'},
    {'assetPath': 'assets/images/apparel.png', 'label': 'Apparel'},
    {'assetPath': 'assets/images/equipment.jpg', 'label': 'Equipment'},
    {'assetPath': 'assets/images/fitness.png', 'label': 'Fitness'},
  ];

  final products = [
    {
      'name': 'Furo Sports Shoes',
      'price': '\$899',
      'rating': '4.5',
      'image': 'assets/shoes1.png',
    },
    {
      'name': 'Red Tape Shoes',
      'price': '\$1540',
      'rating': '4.8',
      'image': 'assets/shoes2.png',
    },
    {
      'name': 'Optimum Whey',
      'price': '\$2899',
      'rating': '4.0',
      'image': 'assets/whey.png',
    },
    {
      'name': 'GymShark Duffel Bag',
      'price': '\$2588',
      'rating': '3.5',
      'image': 'assets/bag.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'E-Sport',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite,
                          color: Color.fromARGB(255, 205, 4, 4)),
                      SizedBox(width: 12),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: kPrimaryColor,
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 16),

              /// Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for Products',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Discover Text
              Text(
                'Discover',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(text: 'Explore Our '),
                    TextSpan(
                      text: 'New',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' Collections'),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Categories
              SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey.shade200,
                          child: ClipOval(
                            child: Image.asset(
                              categories[index]['assetPath']!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(categories[index]['label']!),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              /// Product Grid
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 220,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                product['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            product['name']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(product['price']!),
                          Row(
                            children: [
                              Icon(Icons.star, size: 14),
                              Text(product['rating']!),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /// Bottom NavBar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined), label: 'My Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
