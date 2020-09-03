class SliderModel{

  String imagePath1;
  String title;
  String desc;
  String imagePath;

  SliderModel({this.imagePath1, this.title, this.desc, this.imagePath});

  void setImageAssetPath1(String getImagepath){
    imagePath1 = getImagepath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc = getDesc;
  }
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }

  String getImageAssetPath1(){
    return imagePath1;
  }
  String getTitle(){
    return title;
  }
  String getdesc(){
    return desc;
  }
  String getImageAssetPath(){
    return imagePath;
  }

}

List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath1("assets/logo (4).png");
  sliderModel.setTitle("Welcome,");
  sliderModel.setDesc("Daily deserts for your mind.");
  sliderModel.setImageAssetPath("assets/Group 2842.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath1("assets/logo (4).png");
  sliderModel.setTitle("");
  sliderModel.setDesc("");
  sliderModel.setImageAssetPath("assets/Group 2843.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath1("assets/logo (4).png");
  sliderModel.setTitle("");
  sliderModel.setDesc("");
  sliderModel.setImageAssetPath("assets/Group 2844.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}