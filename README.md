# MyPortfolio Mobile App

## Deskripsi
**NAMA : JORDAN MANAKSAK HUTAHAEAN**  
**NPM : 2506532580**  
**KELAS : PBP E**  
**JURUSAN : ILMU KOMPUTER**  
**UNIVERSITAS : UNIVERSITAS INDONESIA**

---

## Pertanyaan Reflektif Tugas 7

### 1.

Widget Tree adalah struktur hierarki berbentuk pohon yang merepresentasikan seluruh komponen User Interface / UI dalam aplikasi Flutter.
Hubungan induk-anak (parent-child) bekerja dengan cara widget induk (parent) akan selalu memberikan constraints kepada widget anaknya seperti batas minimum dan maksimum ukuran, menanyakan ukuran yang diinginkan widget anaknya, lalu mengatur posisi widget anak tersebut secara horizontal maupun vertikal sebelum melaporkan ukuran final-nya ke widget dengan tingkat yang lebih tinggi di atasnya

### 2.

Berikut adalah daftar seluruh widget yang digunakan beserta perannya:
* MyApp : Berperan sebagai root widget yang menginisialisasi konfigurasi dasar aplikasi.   * MaterialApp: Berfungsi sebagai kerangka utama berbasis Material Design, mengatur tema global (ThemeData), judul aplikasi, dan rute halaman utama (home).   
* MyHomePage : Widget yang berfungsi untuk menyusun tata letak profil serta komponen menu portofolio.   
* Scaffold: Menyediakan kerangka visual halaman yang mengikuti standar Material Design, seperti penyediaan area untuk appBar dan konten utama body.   
* AppBar: Menampilkan judul di bagian atas halaman aplikasi dengan teks judul 'MyPortfolio'   
* Padding: Memberikan jarak ruang kosong (padding) di sekeliling widget anak agar elemen tidak menempel langsung ke tepi layar.   
* Column: Menyusun sekumpulan widget anak secara vertikal dari atas ke bawah.   
* Row: Menyusun sekumpulan widget anak secara horizontal dari kiri ke kanan.   
* InfoCard: Custom widget buatan yang berfungsi merender card informasi identitas (NPM, Nama, dan Kelas).   
* Card: Memberi panel efek bayangan dan sudut melengkung pada komponen InfoCard.   
* Container: Komponen pembungkus yang digunakan untuk mengatur lebar proporsional kartu berdasarkan lebar layar perangkat serta memberikan jarak padding di dalamnya.   
* Text: Menampilkan teks di layar dengan gaya tertentu, seperti judul kartu, isi data NPM/Nama/Kelas, hingga label tombol.   
* SizedBox: Memberikan jarak kosong berukuran tetap secara vertikal antar-elemen.   
* Center: Memposisikan widget anaknya agar berada tepat di tengah ruang yang tersedia. 
* GridView.count: Menampilkan daftar tombol menu dalam format grid dengan jumlah kolom tetap, jarak antar-kolom/baris, serta mengatur shrinkWrap agar ukurannya menyesuaikan isi konten.   
* ItemHomepage: Mendefinisikan struktur data untuk tombol menu yang mencakup nama, icon, dan warna.
* ItemCard: Custom widget yang merepresentasikan setiap kartu tombol menu interaktif (Lihat Proyek, Tambah Proyek, dan Logout).   
* Material: Menyediakan kanvas visual dengan warna latar belakang dinamis dan sudut melengkung.   
* InkWell: Menjadikan area tombol responsif terhadap sentuhan pengguna yang serta memicu kemunculan pesan SnackBar.   
* Icon: Menampilkan ikon grafis dengan warna putih dan ukuran tertentu.

### 3.

MaterialApp berfungsi untuk membungkus sejumlah widget berdasarkan standar Material Design, mengatur navigasi, serta mengatur tema global aplikasi. Widget ini digunakan sebagai root widget karena menyediakan fondasi visual, manajemen rute, dan pengaturan utama yang dibutuhkan oleh sebagian besar komponen turunan di bawahnya.

### 4.

StatelessWidget bersifat statis (immutable) dimana tampilannya tetap dan tidak bisa berubah-ubah sendiri setelah dirender. Sedangkan statefulWidget bersifat dinamis karena punya state yang bisa berubah-ubah, sehingga tampilannya bisa ikut ter-update secara real-time saat ada interaksi User.   
Kita sebaiknya memakai StatelessWidget kalau halaman atau komponennya cuma menampilkan data tetap (seperti kartu profil kita) dan memakai StatefulWidget kalau butuh interaksi yang mengubah data, seperti form input atau tombol counter.   

### 5.

BuildContext adalah objek yang memungkinkan suatu widget mengetahui posisinya dan mengakses data leluhur diatasnya. Di dalam metode build(BuildContext context), konteks ini digunakan sebagai parameter untuk membangun dan mengembalikan sub-pohon widget yang disesuaikan dengan lingkungan sekitarnya.

### 6.

* Hot Reload: Memasukkan kode baru ke aplikasi lalu membangun ulang tampilannya dalam hitungan detik tanpa menghapus data/status yang sedang berjalan.   
* Hot Restart: Memuat ulang kode sekaligus merestart aplikasi dari awal, sehingga status aplikasinya ikut hilang/ulang dari nol.  
* Kita tidak bisa mengandalkan Hot Reload apabila melakukan perubahan pada fungsi utama main(), fungsi inisialisasi status awal (initState()), pengubahan struktur kelas yang mendasar atau, penambahan aset baru, sehingga wajib melakukan Hot/Full Restart

---

## Progress Tugas 7

### 11 November

* Melakukan inisialisasi proyek framework Flutter baru.
* Melakukan refactor dengan memisahkan halaman MyHomePage ke dalam berkas menu.dart.
* Mengubah tema bawaan serta menyesuaikan tampilan awal aplikasi portofolio.
* Menambahkan informasi profil awal beserta komponen-komponen menu utama aplikasi.
* Mengintegrasikan komponen profil dengan menu utama di dalam aplikasi.
* Merapikan dan memperbaiki beberapa bagian kode di dalam berkas menu.dart.

### 16 November

* Mengganti data profil bawaan (profil Burhan) dengan data profil pribadi.
* Menambahkan properti dan penyesuaian warna kustom pada model ItemHomepage serta kartu menu ItemCard
* Menambahkan properti backgroundColor ke dalam komponen SnackBar agar warnanya selaras dengan tombol menu yang ditekan.
* Menambahkan SingleChildScrollView dan memperbaiki primary GridView untuk cegah overflow

---

## AI Disclosure Tugas 7

### Saya menggunakan Gemini untuk membuatkan roadmap dan workflow pengerjaan tugas 7, serta untuk melakukan pengecekan terhadap kebenaran kode. (Link : https://share.gemini.google/31XRzdZqsWa7)

---