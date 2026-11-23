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

## Pertanyaan Reflektif Tugas 8

### 1.

Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() berfungsi mengatur rute navigasi yang dikelola oleh Navigator. Navigator.push() menambahkan rute baru ke bagian paling atas stack sehingga rute sebelumnya tetap berada di bawahnya; Saya memakai metode ini di ItemCard (lib/widgets/project_card.dart) dengan kita membuka form melalui menekan tombol widget : "Add Project", "Add Education", dan "Add Experience". Pengguna juga dapat kembali dengan tombol back bawaan perangkat/browser atau Navigator.pop(). Navigator.pop() berfungsi menghapus rute teratas dari stack dan mengembalikan pengguna ke rute yang berada tepat di bawahnya. Sementara itu, Navigator.pushReplacement() berfungsi menggantikan rute yang sedang aktif di bagian atas stack dengan rute baru; pada LeftDrawer, saya menggunakan Navigator.pushReplacement() ke MyHomePage() sehingga rute aktif digantikan langsung ke halaman utama saat berpindah lewat drawer.   

### 2.

Susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten karena Scaffold menyediakan kerangka dasar yang sama di MyHomePage, ProjectFormPage, EducationFormPage, dan ExperienceFormPage, AppBar mempertahankan judul dan warna di bagian atas layar, serta Drawer (LeftDrawer) menyediakan akses navigasi yang seragam ke berbagai halaman. Contoh penggunaan warna tema portofolio di lebih dari satu halaman adalah warna indigo (Colors.indigo pada AppBar dan tombol simpan form serta ColorScheme.fromSeed(seedColor: Colors.indigo) pada tema aplikasi MyPortfolio).   

### 3.

Tata letak formulir menggunakan Form, SingleChildScrollView, Column, Row, Padding, dan SizedBox dipilih agar seluruh kolom input dan tombol save tersusun terstruktur serta tetap dapat dijangkau pada layar sempit maupun saat keyboard muncul. Widget pengatur jarak seperti Padding dan SizedBox memberi ruang di sekitar widget dan jarak antar komponen agar elemen tidak saling berhimpit, sedangkan widget penggulir seperti SingleChildScrollView memungkinkan konten di scroll secara vertikal ketika tinggi konten melebihi ruang layar yang tersedia atau saat keyboard digital menutupi sebagian layar.

### 4.

GlobalKey<FormState> berfungsi untuk mengakses state dari widget Form untuk memvalidasi dan mengecek kondisi form; fungsi validator pada tiap field memeriksa kesesuaian isian dari input dan mengembalikan pesan error jika tidak valid (atau null jika valid); sedangkan validate() men-trigger seluruh validator di dalam form saat tombol save ditekan dan mengembalikan true hanya jika semua field lolos validasi. Salah satu contoh isian yang ditolak oleh validasi adalah input kosong atau hanya spasi ("   ") pada field wajib (seperti judul/nama atau kolom wajib yang dicek dengan trim().isEmpty), urutan tanggal/tahun yang tidak sesuai, atau format URL yang tidak valid.

Memilih jenis input atau papan ketik saja belum cukup karena pengguna tetap bisa memasukkan spasi saja, mengetik/menempelkan teks di luar batas panjang, memilih tanggal/tahun yang urutannya terbalik, atau memasukkan format yang tidak sesuai aturan domain aplikasi.

---

## Progress Tugas 8

### 18 November

* Menambahkan leftDrawer untuk navigasi menu utama 
* Menambahkan halaman form dan validasi input    
* Menghubungkan navigasi drawer dan tombol Add Project ke ProjectFormPage - - * Merapikan struktur direktori sesuai Tutorial 09

### 22 November

* Menambahkan form untuk Education Section lengkap dengan validasi dan dialog    
* Menambahkan opsi Add Education di drawer dan menghubungkannya ke Education Form    
* Membuat widget View Education & Add Education dan menghubungkannya ke Education Form 

### 22 November

* Menambahkan form untuk Experience Section dengan validasi dan dialog ringkasan 
* Menambahkan opsi Add Experience di drawer dan menghubungkannya ke         Experience Form 
* Membuat widget View Experience dan Add Experience serta menghubungkannya ke Experience Form

---

## AI Disclosure Tugas 8

### Saya menggunakan Gemini untuk membuatkan roadmap dan workflow pengerjaan tugas 8. (Link : https://share.gemini.google/Sm4oso8dN17m)

---