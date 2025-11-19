import 'package:flutter/material.dart';
import 'package:burhanshop/models/product_entry.dart';
import 'package:burhanshop/widgets/left_drawer.dart';
import 'package:burhanshop/screens/product_detail.dart';
import 'package:burhanshop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:burhanshop/widgets/gradient_background.dart';
import 'package:burhanshop/theme/app_colors.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  bool _showOnlyMine = false;
  Future<List<ProductEntry>>? _productFuture;

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('https://malik-alifan-burhanshop.pbp.cs.ui.ac.id/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  int? _extractUserId(Map<String, dynamic> jsonData) {
    if (jsonData.isEmpty) return null;

    final possibleKeys = ['id', 'user_id', 'pk'];
    for (final key in possibleKeys) {
      final value = jsonData[key];
      if (value != null) {
        final parsed = int.tryParse(value.toString());
        if (parsed != null) return parsed;
      }
    }

    final dynamic nestedUser = jsonData['user'];
    if (nestedUser is Map<String, dynamic>) {
      for (final key in possibleKeys) {
        final nestedValue = nestedUser[key];
        if (nestedValue != null) {
          final parsed = int.tryParse(nestedValue.toString());
          if (parsed != null) return parsed;
        }
      }
    }

    return null;
  }

  void _toggleFilter() {
    setState(() {
      _showOnlyMine = !_showOnlyMine;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    _productFuture ??= fetchProduct(request);
    final currentUserId = _extractUserId(request.jsonData);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: _showOnlyMine
                          ? AppColors.surface
                          : AppColors.accent,
                    ),
                    onPressed: currentUserId == null ? null : _toggleFilter,
                    icon: Icon(
                      _showOnlyMine ? Icons.filter_alt_off : Icons.filter_alt,
                    ),
                    label: Text(
                      _showOnlyMine
                          ? 'Tampilkan Semua Produk'
                          : 'Produk Saya Saja',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<ProductEntry>>(
                  future: _productFuture,
                  builder:
                      (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'There are no products in burhanshop yet.',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.subtleText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    final List<ProductEntry> allProducts = snapshot.data!;
                    final List<ProductEntry> filteredProducts =
                        _showOnlyMine && currentUserId != null
                            ? allProducts
                                .where(
                                  (product) =>
                                      product.userId == currentUserId,
                                )
                                .toList()
                            : allProducts;

                    if (filteredProducts.isEmpty) {
                      final emptyMessage = _showOnlyMine
                          ? 'Belum ada produk milik akunmu.'
                          : 'There are no products in burhanshop yet.';
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            emptyMessage,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.subtleText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: filteredProducts[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: filteredProducts[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
