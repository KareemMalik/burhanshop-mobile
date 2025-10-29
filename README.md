# Burhan Shop — Football Shop (mobile)

No. 1 Football Shop in FASILKOM UI

### 📚 Assignment Archive
* [Tugas 2: Implementasi Model-View-Template (MVT) pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-2:-Implementasi-Model%E2%80%90View%E2%80%90Template-(MVT)-pada-Django)
* [Tugas 3: Implementasi Form dan Data Delivery pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-3:-Implementasi-Form-dan-Data-Delivery-pada-Django)
* [Tugas 4: Implementasi Autentikasi, Session, dan Cookies pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-4:-Implementasi-Autentikasi,-Session,-dan-Cookies-pada-Django)
* [Tugas 5: Desain Web menggunakan HTML, CSS dan Framework CSS](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-5:-Desain-Web-menggunakan-HTML,-CSS-dan-Framework-CSS)
* [Tugas 6: Javascript dan AJAX](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-6:-Javascript-dan-AJAX)


***

## Tugas 7: Elemen Dasar Flutter

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur tree yang berisi semua widget yang membentuk tampilan aplikasi. Widget di atas disebut parent (induk) dan widget yang ada di dalamnya disebut child (anak).
Contoh: `Scaffold` (parent) berisi `AppBar`, `Body` (child).

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MaterialApp → membungkus seluruh app, mengatur tema & navigasi.
- Scaffold → kerangka dasar halaman (AppBar + body).
- AppBar → bagian header.
- Column / Row → menyusun widget secara vertikal / horizontal.
- Padding → memberi jarak antar widget.
- Card → membuat tampilan kotak dengan bayangan.
- Text → menampilkan teks.
- GridView.count → menampilkan item dalam bentuk grid.
- Icon → menampilkan ikon.
- Material + InkWell → membuat tombol yang bisa ditekan dan punya efek ripple.
- SnackBar → popup kecil di bawah layar saat tombol ditekan.

### Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Fungsi dari widget `MaterialApp` adalah sebagai pembungkus utama aplikasi Flutter yang berbasis Material Design. 
Sering digunakan sebagai root karena mengatur tema, navigasi, title, dan behavior aplikasi.

### Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
`StatelessWidget` merupakan widget yang tidak bisa berubah. Contoh dari `StatelessWidget` adalah teks yang statis, icon, dan gambar.
Sedangkan, `StatefulWidget` merupakan widget yang bisa berubah atau dinamis. Contoh dari `StatefulWidget` adalah form, input, animasi, dll.

### Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?
`BuildContext` adalah widget yang digunakan untuk memberikan informasi mengenai posisi widget dalam suatu widget tree.
`BuildContext` digunakan untuk:
- Mengakses tema (`Theme.of(context)`)
- Navigasi (`Navigator.push(context,...)`)
- Menampilkan snackbar, dll

### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
- Hot reload: Hot reload digunakan hanya untuk mengupdate UI tetapi tidak mereset aplikasi.
- Hot restart: Hot restart me-reset aplikasi dari awal, seperti relaunch.

### Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.
Saya menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter dengan menggunakan Navigator. Konsepnya seperti menumpuk halaman baru di atas halaman sebelumnya. Misalnya saat ini kita berada di Halaman A, dengan menggunakan navigator, halaman a akan ditumpuk (push) dengan halaman lain.