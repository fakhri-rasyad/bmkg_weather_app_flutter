class Wilayah {
  String kode;
  String nama;

  Wilayah(this.kode, this.nama);

  Map<String, String> toMap() {
    var map = {"kode": kode, "nama": nama};
    return map;
  }

  factory Wilayah.fromMap(Map<dynamic, dynamic> map) {
    String kode = map["kode"] ?? '';
    String nama = map["nama"] ?? '';

    return Wilayah(kode, nama);
  }
}
