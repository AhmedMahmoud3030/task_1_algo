import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  List<String> onBoardingPageImages = [
    'assets/images/on_boarding/1.svg',
    'assets/images/on_boarding/2.svg',
    'assets/images/on_boarding/3.svg',
  ];
  List<String> onBoardingPageTitle = [
    'Get food delivery to your doorstep asap',
    'Buy any food from your favorite restaurant',
    'Enjoy your delicious Food'
  ];
  List<String> onBoardingPageContent = [
    'We have young an professional delivery team that will bring your food as soon as possible to your doorstep',
    'We are constantly adding your favourite restaurant throughout the territory and around your area carfully selected',
    'We need you to enter our foodis online app to get best service and we maintained quality',
  ];

  int currentPageIndex = 0;
  PageController controller = PageController();
  void refresh() {
    emit(OnboardingRefresh());
  }

  void goToLastPage() {
    currentPageIndex = onBoardingPageImages.length - 1;
    controller.animateToPage(currentPageIndex,
        duration: const Duration(seconds: 2), curve: Curves.bounceOut);
    emit(OnboardingRefresh());
  }
}
