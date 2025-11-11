import 'package:flutter/material.dart';
import 'package:burhanshop/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameC = TextEditingController();
  final _descC = TextEditingController();
  final _thumbC = TextEditingController();
  final _priceC = TextEditingController();
  final _stockC = TextEditingController();

  // Non-text fields
  String _category = 'jersey';
  String _size = 'M';
  bool _isFeatured = false;

  final List<String> _categories = const [
    'jersey',
    'football shoes',
    'training gear',
    'training jacket',
    'accessories',
    'equipment',
  ];

  final List<String> _sizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  bool _isValidUrl(String v) {
    final uri = Uri.tryParse(v.trim());
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.hasAuthority;
  }

  @override
  void dispose() {
    _nameC.dispose();
    _descC.dispose();
    _thumbC.dispose();
    _priceC.dispose();
    _stockC.dispose();
    super.dispose();
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameC.text.trim();
    final description = _descC.text.trim();
    final thumbnail = _thumbC.text.trim();
    final price = int.tryParse(_priceC.text.trim()) ?? 0;
    final stock = int.tryParse(_stockC.text.trim()) ?? 0;
    final size = _size;
    final category = _category;
    final isFeatured = _isFeatured;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Produk berhasil disimpan!'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: $name'),
              Text('Deskripsi: $description'),
              Text('Thumbnail: $thumbnail'),
              Text('Harga: $price'),
              Text('Stok: $stock'),
              Text('Size: $size'),
              Text('Kategori: $category'),
              Text('Unggulan: ${isFeatured ? "Ya" : "Tidak"}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((_) {
      _formKey.currentState!.reset();
      _nameC.clear();
      _descC.clear();
      _thumbC.clear();
      _priceC.clear();
      _stockC.clear();
      setState(() {
        _category = 'jersey';
        _size = 'M';
        _isFeatured = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Center(child: Text('Form Tambah Produk')),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameC,
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (v.trim().length < 3) return "Minimal 3 karakter.";
                    if (v.trim().length > 100) return "Maksimal 100 karakter.";
                    return null;
                  },
                ),
              ),

              // Deskripsi Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descC,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (v.trim().length < 10) return "Deskripsi minimal 10 karakter.";
                    if (v.trim().length > 500) return "Deskripsi maksimal 500 karakter.";
                    return null;
                  },
                ),
              ),

              // Thumbnail URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _thumbC,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "https://contoh.com/gambar.jpg",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return "URL thumbnail wajib diisi!";
                    }
                    if (!_isValidUrl(v)) return "URL harus valid (http/https).";
                    return null;
                  },
                ),
              ),

              // Harga Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _priceC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "cth: 499000",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Harga wajib diisi!";
                    final n = int.tryParse(v.trim());
                    if (n == null) return "Harga harus angka.";
                    if (n <= 0) return "Harga harus > 0.";
                    if (n > 1000000000) return "Harga terlalu besar.";
                    return null;
                  },
                ),
              ),

              // Stok Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _stockC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "cth: 25",
                    labelText: "Stok Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Stok wajib diisi!";
                    final n = int.tryParse(v.trim());
                    if (n == null) return "Stok harus angka.";
                    if (n < 0) return "Stok tidak boleh negatif.";
                    if (n > 1000000) return "Stok terlalu besar.";
                    return null;
                  },
                ),
              ),

              // Size Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _size,
                  items: _sizes
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => _size = v ?? 'M'),
                  decoration: InputDecoration(
                    labelText: "Size Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? "Pilih size." : null,
                ),
              ),

              // Kategori Produk
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _category,
                  items: _categories
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(c[0].toUpperCase() + c.substring(1)),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _category = v ?? 'jersey'),
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? "Pilih kategori." : null,
                ),
              ),

              // Is Featured
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (val) => setState(() => _isFeatured = val),
                ),
              ),

              // Tombol Simpan
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo),
                    ),
                    onPressed: _onSave,
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
