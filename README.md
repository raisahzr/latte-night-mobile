Nama    : Raisa Hannaliya Zahra

NPM     : 2206820503

Kelas   : PBP F

<details open>
<summary>Tugas 7</summary>
<br>

## 1. Perbedaan Utama Stateless dan Stateful Widget Flutter
| Stateless | Stateful |
| --- | --- |
| Tidak memiliki keadaan internal yang dapat berubah | Dapat diperbarui/update antarmuka pengguna |
| Digunakan jika tidak perlu merespons perubahan data (teks statis, ikon) | Digunakan jika kita perlu mengelola dan merespons perubahan data (formulir, input) |
| Ex: `Text`, `Icon` | Ex: `TextField`, `Checkbox` |

Kesimpulannya, perbedaan utama keduanya adalah *stateful widget* memiliki *state* yang memungkinkan dirinya bersifat *mutable* dan dapat memperbatui tampilannya berdasarkan perubahan data, sedangkan *stateless widget* bersifat statis dan efisien jika kita tidak perlu merespons perubahan data.


## 2. Widget yang Digunakan dan Fungsinya
| Widget | Fungsi |
| --- | --- |
| `MyHomePage` (stateless) | Widget utama sebagai halaman awal dan utama aplikasi |
| `Scaffold` | Kerangka dasar halaman aplikasi |
| `AppBar` | Menampilkan bar pada bagian atas aplikasi (pada tugas ini berisi nama aplikasi) |
| `body` | Konten utama halaman aplikasi |
| `Padding` | Mengatur jarak di sekitar konten widget |
| `Column` | Mengatur widget secara vertikal |
| `Text` | Menampilkan teks di tengah halaman aplikasi |
| `Gridview.count` | Membuat grid (pada tugas ini untuk ShopCard) |
| `ShopCard` (stateless) | Menampilkan fitur sebagai bentuk card |
| `Material` | Material design seperti background color dan efek |
| `Inkwell` | Menambahkan efek agar terdapat area responsif |
| `Container` | Mengelola tata letak dan tampilan card |
| `Icon` | Menampilkan ikon |
| `Snackbar` | Menampilkan pesan di bagian bawah page selama beberapa detik ketika tombol ditekan |


## 3. Implementasi Checklist Step by Step
**a. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.** 

Saya menginisiasi program Flutter baru menggunakan command `flutter create latte_night_mobile` pada direktori yang saya inginkan. Catatan: Sudah melakukan instalasi Flutter dan ekstensinya (beserta Dart) pada VS Code. Kemudian program akan dibuat secara otomatis beserta seluruh packagenya, untuk menjalankan program cukup dengan command `flutter run`.


**b.  Membuat Tiga tombol Sederhana dengan Ikon dan Teks**

Pada widget `MyHomePage` di `menu.dart`, pertama saya membuat list berisi icon-icon yang ingin ditampilkan:
```
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];
```
Kemudian pada container Grid Layout, saya mengiterasi items untuk ditampilkan menggunakan
```
GridView.count(
    ... // styling margin, color, wrap, padding
    children: items.map((ShopItem item) {
        return ShopCard(item);
    }).toList(),
)
```


**c. Memunculkan Snackbar**

Pada widget `ShopCard` sebagai penampil fitur sebagai bentuk card di `menu.dart`, saya membuat area yang responsif terhadap sentuhan dengan `onTap: ()` di dalam widget `Inkwell`. Kemudian untuk memunculkan snackbar, di dalam onTap saya menggunakan  `ScaffoldMessenger` untuk menampilkan pesan dengan isi konteksnya seperti berikut:
```
onTap: () {
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}")));
},
```

</details>


<details open>
<summary>Flutter Documentation</summary>
<br>
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
</details>