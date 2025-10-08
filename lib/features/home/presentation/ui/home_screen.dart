import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/bottom_nav_bar.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/categories_list.dart';
import 'widgets/home_header.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentNavIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              categoriesAndProductsLoaded: (categories, products) {
                final cubit = context.read<HomeCubit>();
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HomeHeader(),
                            SizedBox(height: 24.h),
                            HomeSearchBar(
                              controller: _searchController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  cubit.filterProductsByCategory(
                                      cubit.selectedCategoryId);
                                }
                              },
                              onMicTap: () {},
                            ),
                            SizedBox(height: 24.h),
                            CategoriesList(
                              categories: categories,
                              selectedCategoryId: cubit.selectedCategoryId,
                              onCategoryTap: (categoryId) {
                                cubit.filterProductsByCategory(categoryId);
                              },
                            ),
                            SizedBox(height: 24.h),
                            ProductsGrid(products: products),
                          ],
                        ),
                      ),
                    ),
                    BottomNavBar(
                      currentIndex: _currentNavIndex,
                      onTap: (index) {
                        setState(() {
                          _currentNavIndex = index;
                        });
                      },
                    ),
                  ],
                );
              },
              error: (error) => Center(
                child: Text(
                  'Error: ${error.apiErrorModel.message ?? 'Unknown error'}',
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
