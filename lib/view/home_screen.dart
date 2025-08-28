import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List catagories = [
    "assets/png/bag.png",
    "assets/png/perfume.png",
    "assets/png/watch.png",
    "assets/png/bag.png",
    "assets/png/perfume.png",
    "assets/png/watch.png",
    "assets/png/bag.png",
    "assets/png/perfume.png",
    "assets/png/watch.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Name (left), Image (right)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, John",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage("assets/png/person.png"),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                // Search box
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 28),
                // Option and See all row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Categories row with fixed box and scrolling images
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.12),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "ALL",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Container(
                        height: 90,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: catagories.length,
                          separatorBuilder: (context, index) => SizedBox(width: 18),
                          itemBuilder: (context, index) {
                            return CatagoryTitle(image: catagories[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                // Row with "All Categories" and "See all"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                // Row with two product containers
                Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        image: "assets/png/bag.png",
                        name: "Bag",
                        price: "\$49.99",
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: ProductCard(
                        image: "assets/png/watch.png",
                        name: "Watch",
                        price: "\$89.99",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                // ...add more widgets below as needed...
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatagoryTitle extends StatelessWidget {
  final String image;
  const CatagoryTitle({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const ProductCard({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image, height: 60),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.orange, size: 32),
                    onPressed: () {},
                    splashRadius: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}