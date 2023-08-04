class SliderModel{
  String image;

// images given
  SliderModel({required this.image});

// setter for image
  void setImage(String getImage){
    image = getImage;
  }

// getter for image
  String getImage(){
    return image;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel(image: '');

// 1
  sliderModel.setImage("images/slider2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');

// 2
  sliderModel.setImage("images/slider2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');

// 3
  sliderModel.setImage("images/slider2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel(image: '');
  return slides;
}
