class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/carousel_1.png"},
  {"image": "assets/images/carousel_2.png"},
  {"image": "assets/images/carousel_3.png"},
];
