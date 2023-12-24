import 'package:flutter/material.dart';
import 'package:latte_night_mobile/models/product.dart';
import 'package:latte_night_mobile/widgets/left_drawer.dart';

class DetailProduct extends StatefulWidget {
  final Product product;

  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Detail Product',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 166, 188, 188),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.product.fields.name,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Amount: ${widget.product.fields.amount}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Amount: ${widget.product.fields.price}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Amount: ${widget.product.fields.category}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Description: ${widget.product.fields.description}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ketika tombol ditekan
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),            
          ],
        ),
      ),
    );
  }
}