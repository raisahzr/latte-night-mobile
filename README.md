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
<summary>Tugas 8</summary>
<br>

## 1. Navigator.push() vs Navigator.pushReplacement()
`Navigator.push()` digunakan untuk menambahkan route baru ke tumpukan route, sementara `Navigator.pushReplacement()` menggantikan rute saat ini dengan rute baru. 

`Navigator.push()` akan menambahkan ShopFormPage ke tumpukan route di atas MyHomePage sehingga route ShopFormPage berada di top stack:
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ShopFormPage()),
);
```
`Navigator.pushReplacement()` akan menghapus route ShopFormPage yang ditampikan dan menggantinya dengan route MyHomePage sehingga tidak memgubah kondisi stack:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```


## 2. Layout Widget Flutter
| Layout Widget | Penggunaan |
| --- | --- |
| `Container` | Widget serbaguna, dapat menjadi wadah dan mengatur widget lain |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `GridView` | Menyusun widget dalam susunan grid |
| `ListView` | Menampilkan item dengan tampilan scroll |
| `Stack` | Menumpuk widget |
| `Sizedbox` | Memisahkan antar elemen pada widget |
| `Expanded`, `Flexible` | Memberi ruang sesuai berdasarkan prioritas/proporsi |


## 3. Elemen Input Form
**a. `TextFormField`**

Saya menggunakan elemen input ini untuk menyediakan input teks bagi user (dalam hal ini atributnya mencakup nama, jumlah, harga, kategori, dan deskripsi item) dengan dekorasi placeholder dan label sehingga user dapat mengetahui keterangan input. TextFormField juga memungkinkan kita untuk melakukan validasi terhadap input user, seperti input yang tidak boleh kosong, input jumlah & harga yang harus berupa angka, dan input kategori hanya menerima 'coffee' atau 'non-coffee'.


**b. `ElevatedButton`**

Saya menggunakan elemen input ini untuk menyediakan button save yang ketika ditekan dapat menyimpan dan melakukan validasi form, kemudian setelah semua tervalidasi akan memunculkan pop up dialog berisi informasi input pengguna


## 4. Clean Architecture Flutter
Clean Architecture adalah pendekatan pengembangan perangkat lunak yang dirancang untuk memisahkan kode menjadi lapisan-lapisan dengan tanggung jawab yang jelas. Pada aplikasi Flutter, penerapan Clean Architecture melibatkan pembagian kode ke dalam beberapa lapisan, seperti:

a. Lapisan fitur/presentasi (widget, framework, UI, view models)

b. Lapisan domain/bisnis (untuk logika dan aturan bisnis aplikasi seperti use cases, entities)

c. Lapisan data (pengambilan data seperti data sources API/database)

Dengan penerapan Clean Architecture, setiap lapisan memiliki tanggung jawab jelas dan dapat diuji secara terpisah (lapisan fitur dan bisnis saling independen). Clean Architecture membantu mencegah ketergantungan siklik antara lapisan dan memungkinkan perubahan pada satu lapisan tanpa mempengaruhi lapisan lainnya.


## 5. Implementasi Checklist Step by Step
**a. Membuat halaman formulir** 

Membuat file baru pada direktori `lib` dengan nama `shoplist_form.dart` :
```
class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }
}
```
Untuk menambahkan elemen input sesui projek Django sebelumnya, pada class `_ShopFormPageState` pertama saya menginisiasi terlebih dahulu variabel-variabel yang dibutuhkan:
```
final _formKey = GlobalKey<FormState>();
String _name = "";
int _price = 0;
String _description = "";
String _category = "";
int _amount = 0;
```
Kemudian untuk memunculkan form input dan melakukan validasi, di dalam body Form buatlah masing-masing input sebagai children berupa padding dari 
```
child: SingleChildScrollView(
    child: Column(//children padding//)
)
```
Isi paddingnya kurang lebih sama, berikut saya berikan salah satu contoh untuk input jumlah:
```
Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        decoration: InputDecoration(
            hintText: "Jumlah",
            labelText: "Jumlah",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        onChanged: (String? value) {
            setState(() {
                _amount = int.parse(value!);
            });
        },
        validator: (String? value) {
        if (value == null || value.isEmpty) {
            return "Jumlah tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
            return "Jumlah harus berupa angka!";
        }
        return null;
        },
    ),
),
```
Sebagai tambahan, pada validator input kategori saya menambahkan 
```
if (value != "coffee" && value != "non-coffee") {
    return "Kategori harus berupa 'coffee' atau 'non-coffee'!";
}
```
Selanjutnya, untuk tombol save cukup memanfaatkan ElevatedButton:
```
Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color.fromARGB(255, 166, 188, 188),),
            ),
            ...
            child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
            ),
        ),
    ),
),
```


**b. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama**

Pada class `ShopCard`` di `shop_card.dart`, bagian return Material(...) cukup melakukan routing dengan Navigator.push():
```
if (item.name == "Tambah Item") {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShopFormPage()),
    );
}
```


**c. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol `Save` pada halaman formulir tambah item baru**

Di dalam ElevatedButton pada poin (a), tambahkan kode berikut, onPressed berarti kode akan terpicu ketika tombol (save) ditekan, kemudian AlertDialog akan menampilkan informasi input dalam bentuk pop up dialog:
```
onPressed: () {
    if (_formKey.currentState!.validate()) {
    showDialog(
        context: context,
        builder: (context) {
            return AlertDialog(
                title: const Text('Produk berhasil tersimpan'),
                content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                        Text('Nama: $_name'),
                        Text('Jumlah: $_amount'),
                        Text('Harga: $_price'),
                        Text('Kategori: $_category'),
                        Text('Deskripsi: $_description'),
                        ],
                    ),
                ),
                actions: [
                    TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                            Navigator.pop(context);
                        },
                    ),
                ],
            );
        },
    );
    _formKey.currentState!.reset();
    }
},
```


**d. Membuat sebuah drawer pada aplikasi**

Agar drawer memiliki dua opsi Halaman Utama dan Tambah Item, tambahkan kode berikut pada class `LeftDrawer` di `left_drawer.dart` bagian `return Drawer(...)`:
```
ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    // Bagian redirection ke MyHomePage
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(),
            ));
    },
),
ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Produk'),
    // Bagian redirection ke ShopFormPage
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
            ));
    },
),
```
Pada bagian `onTap()`, Navigator.pushReplacement berfungsi sebagai router agar ketika user menekan opsi akan diarahkan pada halaman yang sesuai.

</details>

<details open>
<summary>Tugas 9</summary>
<br>

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa, kita dapat menggunakan metode dynamic tanpa perlu membuat model dahulu. Tetapi, implementasi yang lebih baik tergantung pada kebutuhan dan kompleksitas program kita. Jika kita ingin memanipulasi atau melakukan klasifikasi dengan data JSON, akan lebih efisien menggunakan model. Selain itu, untuk program yang kompleks, kelebihan lain menggunakan model adalah lebih terstruktur dan compiler dapat memberikan lapisan keamanan dengan mengetahui tipe data secara statis.


## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter
CookieRequest adalah objek untuk mengelola informasi cookie dalam permintaan HTTP di Flutter. Objek CookieRequest biasanya digunakan untuk mengelola cookie yang terkait dengan permintaan HTTP, seperti menambahkan, menghapus, atau memperbarui cookie. 

Dalam konteks Flutter atau pengembangan aplikasi berbasis Flutter, kita dapat menggunakan instance CookieRequest yang perlu dibagikan ke semua komponen aplikasi, dengan tujuan menjaga konsistensi atau berbagi status otentikasi atau informasi sesi antar berbagai bagian aplikasi. Ini dapat membantu dalam menyimpan dan mengelola informasi cookie secara terpusat, sehingga berbagai bagian aplikasi dapat mengakses dan memanfaatkannya dengan mudah.


## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter

1. Tentukan model data Flutter yang sesuai dengan struktur JSON. Model ini harus memiliki atribut yang sesuai dengan properti dalam JSON.
2. Gunakan library serialisasi/deserialisasi JSON untuk mengubah string JSON menjadi objek Dart. Pada tugas ini, kita dapat menggunakan QuickType
3. Membuat instance dari model data yang telah ditentukan dan map atribut-atributnya dengan nilai-nilai dari map Dart yang dihasilkan dari JSON
4. Lakukan operasi logika atau manipulasi data yang diperlukan pada objek model yang telah dibuat
5. Gunakan widget Flutter seperti, pada tugas ini menggunakan ListView, atau widget lainnya untuk menampilkan data ke antarmuka pengguna (UI)


## 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter

1. Tentukan endpoint di Django untuk login (pada authentication/url.py) yaitu /login/
2. Mengirim data dari formulir Flutter ke Django menggunakan metode HTTP (misalnya, POST request) untuk mengirim data login dari Flutter ke endpoint API Django yang telah ditentukan
3. Melakukan proses logika autentikasi pada Django di authentication/views.py
4. Django akan mengembalikan respons ke Flutter dengan token akses
5. Jika autentikasi berhasil, kita dapat menyimpan token akses dan memberi akses ke halaman MyHomePage dan menampilkan Snackbar 


## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing
| Widget | Fungsi |
| --- | --- |
| `MaterialApp` | Widget root dari widget-tree Flutter dan menyediakan beberapa konfigurasi untuk aplikasi |
| `Scaffold` | Kerangka dasar halaman aplikasi |
| `Drawer` | Menampilkan menu navigasi yang dapat diakses dengan menggeser dari kiri ke kanan |
| `DrawerHeader` | Menampilkan bagian header dari drawer |
| `ListTile` | Menampilkan setiap item di dalam daftar drawer |
| `SingleChildScrollView` | Membuat halaman dapat di-scroll |
| `AppBar` | Menampilkan bar pada bagian atas aplikasi (pada tugas ini berisi nama aplikasi) |
| `Form` | Menyimpan formulir Flutter dan menyediakan metode untuk memvalidasi, menyimpan, serta mereset aplikasi |
| `TextFormField` | Membuat input field sehingga pengguna dapat memasukkan teks |
| `EvelatedButton` | Membuat tombol dengan efek “terang” saat ditekan |
| `FutureBuilder` | Menggunakan nilai yang dihasilkan oleh `Future` untuk membangun UI-nya |
| `Key` | Mengidentifikasi suatu widget di antara widget lainnya (global) |
| `TextField` | Membuat kotak teks tempat pengguna dapat memasukkan input |
| `Consumer`, `Provider` | Mengonsumsi dan menyediakan objek untuk CookieRequest |
| `Card` | Membuat layout dasar untuk menampilkan informasi dalam bentuk kartu |

notes: selebihnya kurang lebih sama dengan Tugas 7


## 6. Implementasi Checklist Step by Step
**a. Membuat halaman login pada proyek tugas Flutter.**

Membuat file baru di `screens/login.dart` yang berisi input user untuk memasukkan username dan password.


**b. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter**

Menginstal package yang telah disediakan dengan perintah `flutter pub add pbp_django_auth`, lalu memodifikasi root widget dalam proyek Flutter untuk menyediakan library CookieRequest ke semua child widgetnya dengan Provider.


**c. Membuat model kustom sesuai dengan proyek aplikasi Django**

Menggunakan website QuickType untuk mengkonversi bentuk model data JSON pada Django menjadi Dart. Hal ini dilakukan dengan copy data JSON melalui akses endpoint nya ke website, mengganti nama model dan bahasa menjadi Dart. Kode yang dikonversi dimasukkan pada `product.dart` di `lib/models`


**d. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy**

Install dependensi tambahan yang dibutuhkan dengan `flutter pub add http` dan izin akses internet pada `AndroidManifest.xml` di Flutter. Buat file baru `list_product.dart` pada `lib/screens`. Definisikan class `ProductPage` sebagai StatefulWidget, lalu di dalam widget menggunakan futureBuilder untuk menampilkan daftar produk pada `build()`. Flutter akan mengambil data yang sudah didapatkan dari JSON dengan `ListView.builder` dan menampilkan informasi-informasi produk tersebut. Lakukan routing dengan icon Lihat Produk di MyHomePage dan dengan LeftDrawer.
```
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
```


**e. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item**

Routing dengan atribut nama produk untuk redirect ke page detail produk yang sesuai dengan navigator:
```
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
```

Untuk menampilkan seluruh atribut model memiliki cara yang sama dengan list_product, perbedaannya hanya ketika mengambil data dari JSON, hanya ambil berdasarkan id yang sesuai (endpoint json/id). Untuk tombol yang mengarahkan kembali ke Home, saya menambahkan ElevatedButton berisi navigator:
```
Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 166, 188, 188),),
        ),
        onPressed: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        },     
        child: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
        ),
    ),
    ),
),
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
