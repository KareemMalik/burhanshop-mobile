# Burhan Shop — Football Shop (mobile)

No. 1 Football Shop in FASILKOM UI

### 📚 Assignment Archive
* [Tugas 2: Implementasi Model-View-Template (MVT) pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-2:-Implementasi-Model%E2%80%90View%E2%80%90Template-(MVT)-pada-Django)
* [Tugas 3: Implementasi Form dan Data Delivery pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-3:-Implementasi-Form-dan-Data-Delivery-pada-Django)
* [Tugas 4: Implementasi Autentikasi, Session, dan Cookies pada Django](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-4:-Implementasi-Autentikasi,-Session,-dan-Cookies-pada-Django)
* [Tugas 5: Desain Web menggunakan HTML, CSS dan Framework CSS](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-5:-Desain-Web-menggunakan-HTML,-CSS-dan-Framework-CSS)
* [Tugas 6: Javascript dan AJAX](https://github.com/KareemMalik/burhan-shop/wiki/Tugas-6:-Javascript-dan-AJAX)
* [Tugas 7: Elemen Dasar Flutter](https://github.com/KareemMalik/burhanshop-mobile/wiki/Tugas-7:-Elemen-Dasar-Flutter)
* [Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements](https://github.com/KareemMalik/burhanshop-mobile/wiki/Tugas-8:-Flutter-Navigation,-Layouts,-Forms,-and-Input-Elements)


***

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?
Dalam pengembangan Flutter, penggunaan model class Dart ketika mengambil atau mengirim data JSON sangat penting untuk memastikan bahwa struktur data memiliki konsistensi, kejelasan tipe, dan keamanan terhadap kesalahan. Model membantu memaksa setiap field JSON untuk dipetakan ke tipe data Dart yang sesuai, sehingga proses validasi tipe dan null-safety dapat dilakukan secara otomatis oleh compiler. Sebaliknya, apabila kita langsung menggunakan `Map<String, dynamic>` tanpa model, seluruh data menjadi tidak terstruktur dan rentan terhadap kesalahan seperti typo, tipe data yang tidak sesuai, dan nilai null yang tidak terduga. Hal ini berpotensi menyebabkan runtime error yang sulit dilacak serta menurunkan maintainability, karena struktur data tidak terdokumentasi dengan jelas dan perubahan pada API backend akan membutuhkan penyesuaian di banyak bagian kode.

### Apa fungsi package `http` dan `CookieRequest` dalam tugas ini? Jelaskan perbedaan peran `http` vs `CookieRequest`.
Package `http` digunakan untuk melakukan komunikasi HTTP dasar seperti GET dan POST secara stateless. Artinya, package ini tidak menyimpan informasi sesi atau cookie sehingga cocok untuk mengakses endpoint yang tidak membutuhkan autentikasi. Sebaliknya, `CookieRequest` merupakan bagian dari `pbp_django_auth` dan berfungsi untuk melakukan request HTTP yang menyertakan informasi sesi Django. Setelah proses login, Django mengembalikan cookie sesi yang kemudian disimpan di dalam instance `CookieRequest`, sehingga semua request berikutnya dapat menggunakan identitas autentik pengguna tersebut. Dengan demikian, perbedaan utama keduanya terletak pada pengelolaan sesi: http hanya mengirim request biasa tanpa autentikasi, sedangkan `CookieRequest ` digunakan untuk request yang membutuhkan status login pengguna.

### Jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance `CookieRequest` perlu dibagikan ke seluruh komponen Flutter melalui mekanisme state management seperti `Provider`, agar setiap bagian aplikasi dapat mengakses informasi sesi yang sama. Karena proses autentikasi berbasis cookie dan sesi Django, maka setiap request yang dilakukan setelah login harus menggunakan cookie yang identik untuk mempertahankan status autentikasi pengguna. Apabila setiap halaman menggunakan instance `CookieRequest` yang berbeda, maka sesi tidak akan tersinkronisasi dan aplikasi tidak akan dapat mempertahankan status login. Oleh karena itu, menggunakan satu instance global menjamin konsistensi state autentikasi di seluruh aplikasi.

###  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Agar Flutter dapat berkomunikasi dengan Django, beberapa konfigurasi konektivitas perlu disiapkan. Pertama, alamat `10.0.2.2` harus ditambahkan ke dalam `ALLOWED_HOSTS` Django karena alamat tersebut merupakan representasi localhost yang dapat diakses dari emulator Android. Tanpa konfigurasi ini, Django akan menolak request dengan menampilkan kesalahan Invalid HTTP_HOST header. Selanjutnya, pengaturan CORS perlu diaktifkan agar Django dapat menerima permintaan dari aplikasi yang berjalan di lingkungan berbeda. Selain itu, pengaturan SameSite pada cookie sangat penting untuk memastikan bahwa cookie sesi dari Django dapat diterima dan disimpan oleh Flutter melalui `CookieRequest`. Tanpa pengaturan yang benar, cookie tidak akan dikirim atau diterima sehingga autentikasi tidak akan berfungsi. Di sisi Android, aplikasi harus memiliki izin akses internet pada `AndroidManifest.xml`. Jika izin ini tidak diberikan, aplikasi tidak dapat terhubung ke backend dan seluruh request akan gagal. Secara keseluruhan, kegagalan mengonfigurasi aspek-aspek tersebut akan menyebabkan aplikasi tidak dapat berkomunikasi dengan Django, gagal memuat data, atau tidak dapat melakukan autentikasi pengguna.

###  Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Proses pengiriman data dimulai ketika pengguna mengisi formulir pada Flutter. Setelah formulir divalidasi, data dikumpulkan dan dikirim ke Django melalui endpoint yang sesuai menggunakan `http` atau `CookieRequest`. Django menerima data tersebut, memvalidasinya, memprosesnya melalui view, dan menyimpannya ke dalam basis data. Setelah proses penyimpanan selesai, Django mengembalikan response berupa data JSON atau status keberhasilan. Flutter kemudian menerima JSON tersebut, memetakannya kembali ke dalam model Dart, dan menampilkannya kepada pengguna melalui widget yang sesuai. Mekanisme ini memastikan alur data yang konsisten, mulai dari input pengguna hingga penyajian data hasil pemrosesan.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dimulai ketika pengguna melakukan registrasi dengan mengirimkan data akun melalui formulir Flutter ke endpoint register Django. Django kemudian melakukan validasi dan membuat akun baru jika data valid. Setelah registrasi, pengguna dapat melakukan login melalui Flutter, yang akan mengirimkan username dan password ke endpoint login Django menggunakan `CookieRequest`. Django memverifikasi kredensial menggunakan sistem autentikasinya dan, jika berhasil, mengembalikan cookie sesi. Cookie tersebut disimpan otomatis oleh `CookieRequest` sehingga seluruh request berikutnya membawa identitas pengguna yang telah login. Dengan demikian, Django dapat mengenali pengguna pada setiap request selanjutnya. Logout juga dilakukan melalui endpoint Django, di mana Django menghapus sesi dan `CookieRequest` menghilangkan cookie lokal sehingga status autentikasi pengguna berakhir. Setelah itu, Flutter menampilkan kembali halaman login.

### Langkah - Langkah Implementasi
1. Membuat Model Dart 

Saya terlebih dahulu melihat struktur JSON yang dikirim Django, kemudian menentukan field penting seperti id, name, dan price. Dari struktur tersebut, saya membuat model Dart yang memiliki fungsi fromJson dan toJson. Model ini memastikan tipe data terkontrol, null-safety terjaga, dan data mudah dipetakan saat pengambilan maupun pengiriman.

2. Menguji Konektivitas Dasar dengan http

Saya menambahkan dependency http, lalu mengirim permintaan GET sederhana ke endpoint Django menggunakan http.get. Tujuan langkah ini adalah memastikan bahwa Flutter dapat terhubung ke server tanpa memikirkan autentikasi terlebih dahulu.

3. Mengonfigurasi Django agar Dapat Diakses dari Emulator

Saya menambahkan 10.0.2.2 ke ALLOWED_HOSTS karena alamat itu mewakili localhost dari sudut pandang emulator. Setelah itu, saya mengaktifkan CORS dan memastikan pengaturan cookie (SameSite) tidak menghalangi pengiriman sesi. Semua ini dilakukan agar Django dapat menerima request dari Flutter secara aman.

4. Mengaktifkan Izin Internet di Android

Saya menambahkan `<uses-permission android:name="android.permission.INTERNET" />` pada `AndroidManifest.xml` agar aplikasi Flutter dapat mengakses jaringan. Tanpa izin ini, request apa pun akan gagal.

5. Mengintegrasikan CookieRequest sebagai State Global

Saya menggunakan Provider untuk membuat satu instance CookieRequest yang dibagikan ke seluruh widget. Ini bertujuan agar session cookie yang diberikan Django setelah login tetap konsisten untuk setiap request berikutnya.

6. Membuat Form Login, Register, dan Logout

Saya membuat form untuk login dan register di Flutter, lalu mengirim data tersebut menggunakan CookieRequest.post ke endpoint Django. Jika login berhasil, CookieRequest menyimpan cookie sesi, dan saya navigasikan pengguna ke halaman utama. Untuk logout, saya memanggil endpoint logout Django dan mengembalikan pengguna ke halaman login.

7. Mengambil dan Mengirim Data dengan Autentikasi

Setelah autentikasi berjalan, saya menggunakan CookieRequest.get dan postJson untuk mengakses endpoint Django yang memerlukan login. Data dari Django saya konversi ke model Dart, dan data dari Flutter saya kirim sebagai JSON menggunakan model toJson.

8. Menguji Alur End-to-End

Terakhir, saya menguji seluruh proses mulai dari login, mengisi form, mengirim data, hingga data ditampilkan kembali di Flutter melalui endpoint JSON. Langkah ini memastikan seluruh konfigurasi dan implementasi bekerja dengan baik.