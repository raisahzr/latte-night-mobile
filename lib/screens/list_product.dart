import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latte_night_mobile/models/product.dart';
import 'package:latte_night_mobile/screens/detail_product.dart';
// import 'package:latte_night_mobile/screens/menu.dart';
import 'package:latte_night_mobile/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Product> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Product.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Product',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 166, 188, 188),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    "Tidak ada data produk.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    // Navigate to detail product page when product name is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduct(
                          productId: snapshot.data![index].pk.toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "Amount: ${snapshot.data![index].fields.amount}"),
                        const SizedBox(height: 10),
                        Text(
                            "Price: ${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        Text("Category: ${snapshot.data![index].fields.category}"),
                        const SizedBox(height: 10),
                        Text(
                            "Description: ${snapshot.data![index].fields.description}"),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}