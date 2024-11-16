import 'dart:async';

class User {
  String name;
  int age;
  late List<Product> products; // late initialization
  Role? role; // nullable

  User(this.name, this.age);
}

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

enum Role { Admin, Customer }

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age);

  void addProduct(Product product, Map<String, Product> productMap,
      Set<String> productSet) {
    if (productSet.contains(product.productName)) {
      print('Produk ${product.productName} sudah ada dalam daftar!');
    } else {
      try {
        if (!product.inStock) {
          throw Exception(
              'Produk ${product.productName} tidak tersedia dalam stok.');
        }
        products.add(product);
        productMap[product.productName] = product;
        productSet.add(product.productName);
        print('Produk ${product.productName} berhasil ditambahkan.');
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  void removeProduct(Product product) {
    products.remove(product);
    print('Produk ${product.productName} berhasil dihapus.');
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age);

  // Melihat daftar produk
  void viewProducts() {
    if (products.isEmpty) {
      print('Tidak ada produk yang tersedia.');
    } else {
      print('Daftar produk:');
      for (var product in products) {
        print(
            'Nama Produk: ${product.productName}, Harga: ${product.price}, Stok: ${product.inStock ? 'Tersedia' : 'Tidak tersedia'}');
      }
    }
  }
}

Future<void> fetchProductDetails(String productName) async {
  print('Mengambil detail produk $productName...');
  await Future.delayed(Duration(seconds: 2)); // simulasi penundaan
  print('Detail produk $productName berhasil diambil.');
}

// Main Program
void main() async {
  // Inisialisasi Map dan Set
  Map<String, Product> productMap = {};
  Set<String> productSet = {};

  // Membuat user Admin dan Customer
  var admin = AdminUser('Admin ifa', 19);
  var customer = CustomerUser('Customer fita', 23);

  // Inisialisasi produk
  admin.products = [];
  customer.products = admin.products;

  // Membuat produk
  var product1 = Product('Laptop', 15000000.0, true);
  var product2 = Product('Mouse', 150000.0, true);
  var product3 = Product('Keyboard', 300000.0, false);

  // Menambah produk oleh Admin
  admin.addProduct(product1, productMap, productSet);
  admin.addProduct(product2, productMap, productSet);
  admin.addProduct(product3, productMap,
      productSet); // ini akan melempar exception karena tidak tersedia dalam stok

  // Customer melihat daftar produk
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  await fetchProductDetails('Laptop');
}
