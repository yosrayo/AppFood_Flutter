import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shop_app/colors.dart';
import 'package:shop_app/components/custom_text.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controller/homeController.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/products/AllProduct.dart';
import 'package:shop_app/style.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriState createState() => _CategoriState();
}

class _CategoriState extends State<Categories> {
  @override
  int selectedFoodCard = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => Column(
        children: [
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: _searchTextFormField()),
          Container(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryModel.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                child: foodCategoryCard(controller.categoryModel[index].image,
                    controller.categoryModel[index].name, index),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: PrimaryText(
                text: 'Popular', fontWeight: FontWeight.w700, size: 22),
          ),
          Column(
            children: List.generate(
              controller.productModel.length,
              (index) => popularFoodCard(
                  controller.productModel[index].image,
                  controller.productModel[index].name,
                  controller.productModel[index].description,
                  controller.productModel[index].price.toString(),
                  controller.productModel[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) => GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => GestureDetector(
                //width: MediaQuery.of(context).size.width * .4,
                onTap: () {
                  print(
                      "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${controller.productModel[index].price}");
                  Get.to(() =>
                      DetailsScreen(product: controller.productModel[index]));
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      width: 150,
                      child: Container(
                          height: 100,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomCenter,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      color: kPrimaryColor,
                      alignment: Alignment.bottomCenter,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              itemCount: controller.productModel.length,
            ));
  }

  Widget _searchTextFormField() {
    return Container(
      width: SizeConfig.screenWidth * 1,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    HomeController x;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => GestureDetector(
        onTap: () => {
          x = Get.put(HomeController()),
          x.categoryName = controller.categoryModel[index].name,
          print(x.categoryName),
          selectedFoodCard = index,
          x.ClearProducts(),
          x.HomeViewModel(),
          Get.to(AllProducts()),
        },
        child: Container(
          margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedFoodCard == index
                  ? AppColors.primary
                  : AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lighterGray,
                  blurRadius: 15,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(imagePath, width: 40),
              PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
              RawMaterialButton(
                  onPressed: null,
                  fillColor: selectedFoodCard == index
                      ? AppColors.white
                      : AppColors.tertiary,
                  shape: CircleBorder(),
                  child: Icon(Icons.chevron_right_rounded,
                      size: 20,
                      color: selectedFoodCard == index
                          ? AppColors.black
                          : AppColors.white))
            ],
          ),
        ),
      ),
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String weight, String star, p) {
    var index;
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) => Container(
        child: GestureDetector(
          onTap: () => {Get.to(() => DetailsScreen(product: p))},
          child: Container(
            margin: EdgeInsets.only(right: 25, left: 20, top: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
              ],
              color: AppColors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              PrimaryText(
                                text: 'top of the week',
                                size: 16,
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: 200,
                            child: PrimaryText(
                                text: name,
                                size: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          PrimaryText(
                              text: weight,
                              size: 18,
                              color: AppColors.lightGray),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 45, vertical: 20),
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Icon(Icons.add, size: 20),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          child: Row(
                            children: [
                              Icon(Icons.star, size: 12),
                              SizedBox(width: 5),
                              PrimaryText(
                                text: star,
                                size: 18,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(10.0, 20.0, 0.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 20)
                      ]),
                  child: Hero(
                    tag: imagePath,
                    child: Image.network(imagePath, width: 100),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
