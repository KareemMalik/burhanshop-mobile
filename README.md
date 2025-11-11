# Burhan Shop — Football Shop (mobile)

No. 1 Football Shop in FASILKOM UI

### 📚 Assignment Archive
* [Tugas 2: Implementasi Model-View-Template (MVT) pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-2:-Implementasi-Model%E2%80%90View%E2%80%90Template-(MVT)-pada-Django)
* [Tugas 3: Implementasi Form dan Data Delivery pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-3:-Implementasi-Form-dan-Data-Delivery-pada-Django)
* [Tugas 4: Implementasi Autentikasi, Session, dan Cookies pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-4:-Implementasi-Autentikasi,-Session,-dan-Cookies-pada-Django)
* [Tugas 5: Desain Web menggunakan HTML, CSS dan Framework CSS](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-5:-Desain-Web-menggunakan-HTML,-CSS-dan-Framework-CSS)
* [Tugas 6: Javascript dan AJAX](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-6:-Javascript-dan-AJAX)
* [Tugas 7: Elemen Dasar Flutter](https://github.com/KareemMalik/burhanshop-mobile/wiki/Tugas-7:-Elemen-Dasar-Flutter)


***

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
| Aspek | `Navigator.push()` | `Navigator.pushReplacement()` |
|-------|---------------------|-------------------------------|
| **Fungsi utama** | Menambahkan (mendorong) halaman baru ke atas stack tanpa menghapus halaman sebelumnya | Mengganti halaman saat ini dengan halaman baru (halaman lama dihapus dari stack) |
| **Kemampuan kembali (Back)** | ✅ Bisa kembali ke halaman sebelumnya | ❌ Tidak bisa kembali ke halaman sebelumnya |
| **Penggunaan yang tepat** | Saat pengguna mungkin ingin kembali ke halaman sebelumnya | Saat pengguna **tidak perlu** kembali ke halaman sebelumnya |
| **Contoh kode** | `Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));` | `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));` |
| **Contoh di aplikasi Football Shop** | Dari **HomePage** ke **ProductDetailPage** agar pengguna bisa menekan tombol back untuk kembali | Setelah **login berhasil** atau **menambah produk**, langsung ke **HomePage** tanpa bisa kembali ke form sebelumnya |
| **Kapan digunakan** | Navigasi sementara (contoh: melihat detail produk, membuka kategori) | Navigasi final (contoh: setelah login, setelah form disubmit) |

### Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Widget seperti `Scaffold`, `AppBar`, dan `Drawer` dimanfaatkan untuk menciptakan struktur halaman yang konsisten di seluruh aplikasi. `Scaffold` berperan sebagai kerangka utama setiap halaman yang menampung komponen-komponen penting seperti area isi (`body`), bilah atas (`AppBar`), dan menu samping (`Drawer`). `AppBar` digunakan untuk menampilkan judul halaman serta tombol aksi seperti ikon keranjang atau pencarian, sehingga pengguna selalu mendapat konteks yang jelas tentang posisi mereka di aplikasi. Sementara itu, `Drawer` menyediakan navigasi yang seragam ke berbagai halaman seperti `Home`, `Catalog`, `Cart`, dan `Profile`.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
elebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` adalah membuat tampilan form lebih rapi, responsif, dan mudah diakses di berbagai ukuran layar.
* Padding memberi jarak antar elemen agar form tidak tampak padat.
* SingleChildScrollView memungkinkan halaman form di-scroll saat konten melebihi layar, mencegah overflow.
* ListView memudahkan menampilkan banyak field secara vertikal dengan scroll otomatis.

Contoh penggunaan pada program:
```
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
``` 

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk membangun identitas visual yang konsisten, saya menetapkan palet warna brand (mis. primary, secondary, surface, error) di level global lewat ThemeData/ColorScheme, lalu gunakan warna itu secara konsisten pada AppBar, tombol, teks, ikon, input, dan elemen status (success/warning).