import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_search_bar.dart';
import 'models/mock_home_data.dart';
import 'widgets/ads_carousel.dart';
import 'widgets/categories_section.dart';
import 'widgets/products_section.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.getCategories();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AppAssets.logo,
            color: AppColors.blue,
            height: 28,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1 & 2: Search Bar & Cart Icon
              const HomeSearchBar(),
              const SizedBox(height: 8),

              // 3: Ads Carousel
              const AdsCarousel(ads: MockHomeData.ads),
              const SizedBox(height: 12),

              // 4: Categories Section
              CategoriesSection(),
              const SizedBox(height: 16),

              // 5: Products Horizontal Section
              ProductsSection(title: 'Home Appliance'),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
