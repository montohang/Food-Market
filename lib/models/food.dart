part of 'models.dart';

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});

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
      ingredients:
          "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.8),
  Food(
      id: 2,
      picturePath:
          "https://ajheriscom.files.wordpress.com/2018/08/img_78772.jpg",
      name: "Sate Padang",
      description:
          "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.",
      ingredients:
          "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.8),
  Food(
      id: 3,
      picturePath:
          "https://ajheriscom.files.wordpress.com/2018/08/img_78772.jpg",
      name: "Sate Padang",
      description:
          "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.",
      ingredients:
          "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.8),
  Food(
      id: 4,
      picturePath:
          "https://ajheriscom.files.wordpress.com/2018/08/img_78772.jpg",
      name: "Sate Padang",
      description:
          "Sate Padang adalah sebutan untuk tiga jenis varian sate di Sumatra Barat, yaitu Sate Padang, Sate Padang Panjang dan Sate Pariaman. Sate Padang memakai bahan daging sapi, lidah, atau jerohan (jantung, usus, dan tetelan) dengan bumbu kuah kacang kental (mirip bubur) ditambah cabai yang banyak sehingga rasanya pedas.",
      ingredients:
          "daging sapi, lidah, jerohan, jantung, usus,tetelan, kuah kacang kental, cabai",
      price: 200000,
      rate: 4.8),
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
