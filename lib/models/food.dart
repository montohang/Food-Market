part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          "https://ajheriscom.files.wordpress.com/2018/08/img_78772.jpg",
      name: "Sate Padang",
      description:
          "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.",
      ingredients: "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.5,
      types: [FoodType.new_food, FoodType.recommended, FoodType.popular]),
  Food(
      id: 2,
      picturePath:
          "https://www.chilibeli.com/uploads/blog/resep-rendang-padang-asli.jpg",
      name: "Rendang",
      description:
          "Rendang atau randang adalah masakan daging yang berasal dari Minangkabau. Masakan ini dihasilkan dari proses memasak suhu rendah dalam waktu lama menggunakan aneka rempah-rempah dan santan. Proses memasaknya memakan waktu berjam-jam hingga yang tinggal hanyalah potongan daging berwarna hitam pekat dan dedak.",
      ingredients:
          "daging sapi, santan, kunyit, lengkuas, serai, bawang merah, jahe, bawang putih",
      price: 400000,
      rate: 5.0),
  Food(
      id: 3,
      picturePath:
          "https://1.bp.blogspot.com/-JNWEuNfEv5M/WF9eXn3ElQI/AAAAAAAAHPk/FBxFQWD1e2I9P8pIV_V6oXhDEQsquqfpwCLcB/s1600/dendeng-balado-enak-dan-lezat.jpg",
      name: "Dendeng",
      description: "Dendeng adalah daging yang dipotong tipis menjadi serpihan yang lemaknya dipangkas, dibumbui dengan saus asam, asin atau manis dengan dikeringkan dengan api kecil atau diasinkan dan dijemur. Hasilnya adalah daging yang asin dan setengah manis dan tidak perlu disimpan di lemari es.",
      ingredients: "daging sapi, santan, kunyit, lengkuas, serai, bawang merah, jahe, bawang putih",
      price: 200000,
      rate: 4.7,
      types: [FoodType.new_food]),
  Food(
      id: 4,
      picturePath:
          "https://www.denpasarkota.go.id/uploads/datang/datang_192608090857_Inilah5WarungLontongSayurDiWilayahDenpasarSelatan.jpeg",
      name: "Lontong",
      description: "Lontong adalah makanan khas Indonesia yang berkembang di masyarakat Jawa, terbuat dari beras yang dibungkus dalam daun pisang dan dikukus di atas air mendidih selama beberapa jam dan jika air hampir habis dituangkan air lagi demikian berulang sampai beberapa kali.",
      ingredients: "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 3.0,
      types: [FoodType.recommended]),
  Food(
      id: 5,
      picturePath:
          "https://ajheriscom.files.wordpress.com/2018/08/img_78772.jpg",
      name: "Sate Padang",
      description:
          "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.",
      ingredients:
          "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.8),
];
