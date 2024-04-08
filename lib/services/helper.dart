import 'package:flutter/services.dart' as the_bundle;

import 'package:ecommerce_app_2/models/sneakers_class.dart';

class Helper {
  //get all male sneaker
  Future<List<SneakerClass>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakerClassFromJson(data);
    return maleList;
  }

  //get all women sneaker
  Future<List<SneakerClass>> getWomenSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final womenList = sneakerClassFromJson(data);
    return womenList;
  }

  //get all kids sneaker
  Future<List<SneakerClass>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakerClassFromJson(data);
    return kidsList;
  }

  //get single male sneaker
  Future<SneakerClass> getMaleSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakerClassFromJson(data);

    final sneaker = maleList.firstWhere((element) => element.id == id);
    return sneaker;
  }

  //get single women sneaker
  Future<SneakerClass> getWomenSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final womenList = sneakerClassFromJson(data);
    final sneaker = womenList.firstWhere((element) => element.id == id);
    return sneaker;
  }

  //get single kids sneaker
  Future<SneakerClass> getKidsSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakerClassFromJson(data);
    final sneaker = kidsList.firstWhere((element) => element.id == id);
    return sneaker;
  }
}
