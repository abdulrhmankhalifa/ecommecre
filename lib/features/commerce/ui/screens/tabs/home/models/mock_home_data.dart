class AdModel {
  final String title;
  final String subtitle;
  final String discount;
  final String buttonText;
  final String imageUrl;

  const AdModel({
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.buttonText,
    required this.imageUrl,
  });
}

abstract class MockHomeData {
  static const List<AdModel> ads = [
    AdModel(
      title: 'UP TO',
      discount: '25% OFF',
      subtitle: 'For all Headphones\n& AirPods',
      buttonText: 'Shop Now',
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600&auto=format&fit=crop',
    ),
    AdModel(
      title: 'SPECIAL OFFER',
      discount: '30% OFF',
      subtitle: 'For Smart Watches\n& Fitness Bands',
      buttonText: 'Discover',
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=600&auto=format&fit=crop',
    ),
    AdModel(
      title: 'NEW ARRIVALS',
      discount: '15% OFF',
      subtitle: 'Trendy Sneakers\n& Sport Shoes',
      buttonText: 'Buy Now',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=600&auto=format&fit=crop',
    ),
  ];
}
