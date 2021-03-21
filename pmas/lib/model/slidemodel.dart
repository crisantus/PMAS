import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Installer are the Technicians that helps to install"
      " your meter and maintain your meter ");
  sliderModel.setTitle("Installer");
  sliderModel.setImageAssetPath("assets/pmasone.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("A Supervisor is in charge of the work done by the Technicians,"
      "His in Charge to make sure every work is done well");
  sliderModel.setTitle("Supervisor");
  sliderModel.setImageAssetPath("assets/pmastwo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("An Installer or a Technician capture his or her work,take record of it,sync in both offline and online,"
      "the Supervisor can also check take note of the work done by the Installer");
  sliderModel.setTitle("Sync To Server");
  sliderModel.setImageAssetPath("assets/pmasthree.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}