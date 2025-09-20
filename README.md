# 🌦 Aplikasi Cuaca

```
## 📖 Deskripsi Proyek
Aplikasi mobile berbasis Flutter yang menampilkan informasi cuaca di suatu daerah menggunakan API resmi yang disediakan oleh BMKG.

---

## 📋 Fitur
- [ ] Menampilkan informasi cuaca saat ini
- [ ] Prakiraan cuaca untuk 2 hari ke depan
- [ ] Pengambilan data cuaca berdasarkan lokasi (menggunakan GPS)
- [ ] Pencarian cuaca berdasarkan nama lokasi
- [ ] Dukungan mode Gelap dan Terang

---

## 📂 Struktur Proyek
```

lib/
├── features/
├── feature/ #Halaman dari Aplikasi
├── data/ # Pengelolaan API, model, repository  
 ├── domain/ # Manajemen state (File-file Cubit)  
 ├── presentation/ # Tampilan UI (HomeScreen, WeatherDetailScreen, dll.)  
├── widgets/ # Komponen yang dapat digunakan ulang (WeatherCard, CustomButton, dll.)  
├── utils/ # Helper (konstanta, penanganan error, dll.)  
└── main.dart

````

---

## 📑 Dokumentasi
- [v] Deskripsi Proyek
- [ ] Deskripsi Fitur
- [ ] Cara Menggunakan Aplikasi
- [ ] Pengembangan di Masa Depan

---

## 🔨 Teknologi yang Digunakan
- **Flutter**
- **Dart**
- **flutter_bloc (Cubit)**
- **http**
- **geolocator**
- **intl**

---

## 📦 Dependency
```yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.0
  http: ^0.14.0
  geolocator: ^9.0.0
  intl: ^0.17.0
````

---

## 🚀 Instruksi Setup

```
1. Clone repository ini.
2. Install dependency menggunakan `flutter pub get`.
3. Jalankan aplikasi menggunakan `flutter run`.
4. Pastikan memiliki koneksi internet yang stabil untuk mengakses API BMKG.
```

---

## 📸 Screenshot / GIF

```

```

---

## 🔒 Penanganan Error & Loading State

- [ ] Indikator loading yang tepat
- [ ] Pesan error untuk permintaan API yang gagal
- [ ] Opsi untuk mencoba kembali jika terjadi kegagalan

## 📜 Lisensi

```
MIT LICENSE
```

---
