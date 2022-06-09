enum LottieItems {loadingLight,themeChange}

extension LottieItemsExtension on LottieItems{
  String _path(){
    switch(this){
      case LottieItems.loadingLight :
        return 'lottie_loading_book';

      case LottieItems.themeChange :
        return 'lottie_theme_change';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}