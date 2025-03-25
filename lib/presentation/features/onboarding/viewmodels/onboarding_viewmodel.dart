class OnboardingViewModel {
  final List<OnboardingSlide> slides = [
    OnboardingSlide(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome to Ma Fatani',
      description: 'Discover amazing features',
    ),
    OnboardingSlide(
      image: 'assets/images/onboarding2.png',
      title: 'Plan Your Day',
      description: 'Organize your tasks efficiently',
    ),
    OnboardingSlide(
      image: 'assets/images/onboarding3.png',
      title: 'Stay Connected',
      description: 'Keep track of your progress',
    ),
  ];
}

class OnboardingSlide {
  final String image;
  final String title;
  final String description;

  OnboardingSlide({
    required this.image,
    required this.title,
    required this.description,
  });
}
