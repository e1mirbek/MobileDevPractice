class OnboardingModel {
  final String imgPath;
  final String title;
  final String description;

  OnboardingModel({
    required this.imgPath,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> content = [
    OnboardingModel(
      imgPath: "assets/images/Online Groceries-cuate 1.png",
      title: "Buy Grocery",
      description:
          "Choose fresh groceries from your phone\n"
          "and order anytime in just a few taps\n",
    ),
    OnboardingModel(
      imgPath: "assets/images/Delivery-cuate 1.png",
      title: "Fast Delivery",
      description:
          "We deliver your orders quickly and safely\n"
          "right to your doorstep\n",
    ),
    OnboardingModel(
      imgPath: "assets/images/Passionate-cuate 1.png",
      title: "Enjoy Quality Food",
      description:
          "Enjoy high-quality products and fresh food\n"
          "every day with comfort and ease\n",
    ),
  ];
}
