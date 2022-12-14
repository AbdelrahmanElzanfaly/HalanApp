import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/offer_items.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController(){
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();

  bool loading = false;

  List<OfferItem> contents = [
    OfferItem("FirstItem", "100", "200",
        "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/02/dark-chocolate-bar-1296x728-header.jpg?w=1155&h=1528",''),
    OfferItem("Second One", "40", "60",
        "https://jessicainthekitchen.com/wp-content/uploads/2022/03/Avocado-Ice-Cream6525.jpg",''),
    OfferItem("FirstItem", "20", "50",
        "https://www.jiomart.com/images/product/original/490000331/lay-s-magic-masala-potato-chips-52-g-product-images-o490000331-p490000331-0-202203150844.jpg",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
    OfferItem("FirstItem", "1000", "3000",
        "https://i.pinimg.com/originals/0c/25/66/0c25668853266353c84a8d2a03593ccb.png",''),
  ];


}