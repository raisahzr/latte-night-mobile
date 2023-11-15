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
<summary>Flutter Documentation</summary>
<br>

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
</details>
