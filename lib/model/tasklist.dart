class Getdatauser2 {
    Getdatauser2({
        required this.hasil,
    });

    final List<Hasil> hasil;

    factory Getdatauser2.fromJson(Map<String, dynamic> json) => Getdatauser2(
        hasil: List<Hasil>.from(json["hasil"].map((x) => Hasil.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hasil": List<dynamic>.from(hasil.map((x) => x.toJson())),
    };
}

class Hasil {
    Hasil({
        required this.id,
        required this.judul,
        required this.keterangan,
        required this.tanggal,
        required this.waktu,
    });

    final String id;
    final String judul;
    final String keterangan;
    final String tanggal;
    final String waktu;

    factory Hasil.fromJson(Map<String, dynamic> json) => Hasil(
        id: json["id"],
        judul: json["judul"],
        keterangan: json["keterangan"],
        tanggal: json["tanggal"],
        waktu: json["waktu"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "keterangan": keterangan,
        "tanggal": tanggal,
        "waktu": waktu,
    };
}