import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
            onPressed: () {},
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
