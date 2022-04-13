import '/constant/splash.dart';
import '/constant/text_string.dart';

class OnBoardModel {
  String path;
  String header;
  final text;

  OnBoardModel({required this.path, required this.header, this.text});
}

List<OnBoardModel> screens = <OnBoardModel>[
  OnBoardModel(
    path: SplashAnime().splash_one,
    header: SplashHeaderText().header_one,
    text: SplashText().body_one,
  ),
  OnBoardModel(
    path: SplashAnime().splash_two,
    header: SplashHeaderText().header_two,
    text: SplashText().body_two,
  ),
  OnBoardModel(
    path: SplashAnime().splash_three,
    header: SplashHeaderText().header_three,
    text: "",
  ),
];
