import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Reraesya',
      home: HomePage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 185, 144),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 141, 185, 144),
              Color.fromARGB(255, 121, 165, 124),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logohurufR.jpeg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return const Center(
                      child: Text(
                        'R',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 141, 185, 144),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            // App Name
            const Text(
              'Reraesya Shoes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 185, 144),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Row(
          children: [
            // Membuat gambar logo berbentuk bulat
            ClipOval(
              child: Image.asset(
                'assets/images/logohurufR.jpeg',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Toko Reraesya',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 154, 176, 170),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 81, 123, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today\'s Deal',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '50% OFF',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Beli sekarang dan dapatkan diskon spesial!',
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 46, 45, 45),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('BUY IT NOW'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/bannernike.jpg',
                      width: 250,
                      height: 99,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SectionTitle(title: 'Top Rated Freelances'),
            HorizontalListView(items: topRatedFreelances),
            SectionTitle(title: 'Top Shoes'),
            VerticalListViewTopServices(items: topServices),
            SectionTitle(title: 'Best Merek'),
            VerticalListViewBestBookings(items: bestBookings),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 81, 123, 99),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deal Of The Day',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Flat 60% OFF',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 2),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('BUY IT NOW'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/banner2.jpg',
                      width: 260,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SectionTitle(title: 'Recommended Workshops'),
            RecommendedWorkshopsGridView(items: recommendedWorkshops),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Blog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 45, 91, 48),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  HorizontalListView({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.all(2),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(items[index]['image']!),
                ),
                SizedBox(height: 4),
                Text(
                  items[index]['name']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    Text(
                      items[index]['rating'].toString(), // Show rating
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class VerticalListViewTopServices extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  VerticalListViewTopServices({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Bagian kiri: gambar besar dengan layer keterangan di atasnya
                  Expanded(
                    flex: 2, // Mengatur agar gambar lebih lebar
                    child: Stack(
                      children: [
                        // Layer gambar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item['image']!,
                            width: 300, // Lebar gambar
                            height: 150, // Tinggi gambar
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Layer keterangan di atas gambar (hanya menutupi sebagian)
                        Positioned(
                          bottom: 7,
                          right: 20,
                          child: Container(
                            width:
                                190, // Lebar layer keterangan yang lebih kecil
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Rata kiri untuk keterangan
                              children: [
                                // Row untuk gambar profil dan nama produk
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20, // Ukuran gambar profil
                                      backgroundImage: AssetImage(
                                          'assets/images/logowanita.jpg'), // Ganti dengan path gambar profil
                                    ),
                                    const SizedBox(width: 8),
                                    // Teks nama produk di sebelah gambar profil
                                    Expanded(
                                      child: Text(
                                        item['name']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 254, 254),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                // Rating
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    Text(
                                      '4.9',
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                // Harga produk
                                Text(
                                  'Price: ${item['price']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 253, 255, 253),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Tombol Pesan Sekarang
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 66, 149, 79),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pesan Sekarang',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class VerticalListViewBestBookings extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  VerticalListViewBestBookings({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/sneakers2.jpg',
                    width: double.infinity,
                    height: 180, // Sesuaikan tinggi gambar
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/converselogo.jpg'),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Converse',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Shoes in Indonesia',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('4.9'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      "name": "Samba",
      "brand": "Adidas",
      "price": 161.09,
      "quantity": 0,
      "image": 'assets/images/adidas.jpg'
    },
    {
      "name": "Jordan",
      "brand": "Nike",
      "price": 122.49,
      "quantity": 0,
      "image": 'assets/images/nike.jpeg'
    },
    {
      "name": "Eagle Fire",
      "brand": "Lamgles",
      "price": 101.01,
      "quantity": 0,
      "image": 'assets/images/futsal2.jpg'
    },
    {
      "name": "Run Star Trainer",
      "brand": "Converse",
      "price": 85.28,
      "quantity": 0,
      "image": 'assets/images/sneakers2.jpg'
    },
  ];

  double get subtotal {
    return _cartItems.fold(
        0, (total, item) => total + (item["price"] * item["quantity"]));
  }

  double discount = 4.0;
  double deliveryCharges = 2.0;

  void _handleCheckout() async {
    // Validate if any items have quantity > 0
    bool hasItems = _cartItems.any((item) => item["quantity"] > 0);

    if (!hasItems) {
      // Show error dialog if no items selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cart Empty"),
            content: Text("Please add items to your cart before checking out."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate processing delay
    await Future.delayed(Duration(seconds: 2));

    // Hide loading indicator
    Navigator.of(context).pop();

    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Order Successful"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pemesanan anda berhasil!!"),
              SizedBox(height: 8),
              Text("Total Pemesanan:"),
              Text(
                  "Total Items: ${_cartItems.where((item) => item["quantity"] > 0).length}"),
              Text(
                  "Total Jumlah: \$${(subtotal - discount + deliveryCharges).toStringAsFixed(2)}"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Clear cart and close dialogs
                setState(() {
                  for (var item in _cartItems) {
                    item["quantity"] = 0;
                  }
                });
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to previous screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = subtotal - discount + deliveryCharges;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Additional menu options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(item["image"],
                            width: 80, height: 80, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["name"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(item["brand"],
                                  style: const TextStyle(color: Colors.grey)),
                              Text("\$${item["price"]}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 18, 182, 10))),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (item["quantity"] > 0) {
                                        item["quantity"]--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 255, 4, 4),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.remove, size: 16),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${item["quantity"]}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item["quantity"]++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 21, 255, 0),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.add, size: 16),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                              onPressed: () {
                                setState(() {
                                  _cartItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 10,
                    offset: Offset(0, -2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Order Summary",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Items"),
                    Text("${_cartItems.length}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount"),
                    Text("-\$${discount.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Delivery Charges"),
                    Text("\$${deliveryCharges.toStringAsFixed(2)}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _handleCheckout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromARGB(255, 30, 196, 8),
                  ),
                  child: const Center(
                    child: Text("Check Out", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedWorkshopsGridView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  RecommendedWorkshopsGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 2,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    items[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Price: ${items[index]['price']}',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Data lists dengan harga dan rating
final topRatedFreelances = [
  {
    'image': 'assets/images/adidas.jpg',
    'name': 'Adidas Samba',
    'price': 'Rp 2.200.000',
    'rating': 4.5, // Add the rating key
  },
  {
    'image': 'assets/images/nb.jpeg',
    'name': 'New Balance',
    'price': 'Rp 7.499.000',
    'rating': 4.9, // Add the rating key
  },
  {
    'image': 'assets/images/nike.jpeg',
    'name': 'Nike',
    'price': 'Rp 6.598.000',
    'rating': 4.7, // Add the rating key
  },
  {
    'image': 'assets/images/puma.jpeg',
    'name': 'Puma',
    'price': 'Rp 4.599.000',
    'rating': 4.3, // Add the rating key
  },
];

final topServices = [
  {
    'image': 'assets/images/futsal2.jpg',
    'name': 'Sepatu Futsal',
    'description': 'Daya tahan kuat, nyaman, dan tidak licin saat digunakan',
    'price': 'Rp 1.599.000',
  },
  {
    'image': 'assets/images/sniker.jpg',
    'name': 'Sneackers',
    'description': 'Nikmati Keunikannya! Pesan Sekarang Sneakers Pride',
    'price': 'Rp 5.499.000',
  },
  {
    'image': 'assets/images/teplekmerah.jpg',
    'name': 'Flatshoes',
    'description':
        'Jahitan Rapi, Material Kuat! Pesan Sekarang Sepatu Safety Brongkos!',
    'price': 'Rp 2.999.000',
  },
];

final bestBookings = [
  {
    'image': 'assets/images/adidas.jpg',
    'name': 'Adidas',
    'description': 'Service terbaik untuk sepatu Anda',
    'price': 'Rp 2.200.000',
    'rating': 4.3,
  },
  {
    'image': 'assets/images/best2.jpg',
    'name': 'Sport',
    'description': 'Pelayanan cepat dan efisien',
    'price': 'Rp 4.250.000',
    'rating': 4.3,
  },
];

final recommendedWorkshops = [
  {
    'image': 'assets/images/work.jpg',
    'name': 'Workshop Shoes',
    'description': 'Workshop perawatan sepatu terbaik',
    'price': 'Rp 500.000',
  },
  {
    'image': 'assets/images/work.jpg',
    'name': 'Workshop Shoes',
    'description': 'Pengecatan sepatu berkualitas',
    'price': 'Rp 450.000',
  },
  {
    'image': 'assets/images/work.jpg',
    'name': 'Workshop Shoes',
    'description': 'Service dan perbaikan sepatu',
    'price': 'Rp 550.000',
  },
  {
    'image': 'assets/images/work.jpg',
    'name': 'Workshop Shoes',
    'description': 'Segala kebutuhan sepatu Anda',
    'price': 'Rp 600.000',
  },
];
