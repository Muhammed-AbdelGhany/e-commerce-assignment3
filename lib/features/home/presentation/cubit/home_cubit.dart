import 'dart:developer';

import 'package:ecommerce_assignment3/features/home/data/models/category_model.dart';
import 'package:ecommerce_assignment3/features/home/data/models/product_model.dart';
import 'package:ecommerce_assignment3/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<CategoryModel> categoriesList = [];
  List<ProductModel> productsList = [];
  String? selectedCategoryId;

  void getCategoriesAndProducts() async {
    emit(const HomeState.loading());

    final categoriesResponse = await _homeRepo.getCategories();
    final productsResponse = await _homeRepo.getProducts();

    categoriesResponse.when(
      success: (categoriesData) {
        categoriesList = categoriesData.categories ?? [];

        productsResponse.when(
          success: (productsData) {
            productsList = productsData.items ?? [];
            emit(HomeState.categoriesAndProductsLoaded(
              categories: categoriesList,
              products: productsList,
            ));
          },
          failure: (error) {
                    log(" Error fetching product : ${error.apiErrorModel.message}");

            emit(HomeState.error(error));
          },
        );
      },
      failure: (error) {
        log(" Error fetching categories : ${error.apiErrorModel.message}");
        emit(HomeState.error(error));
      },
    );
  }

  void filterProductsByCategory(String? categoryId) async {
    selectedCategoryId = categoryId;
    emit(const HomeState.loading());

    final productsResponse = await _homeRepo.getProducts(
      category: categoryId,
    );

    productsResponse.when(
      success: (productsData) {
        productsList = productsData.items ?? [];
        emit(HomeState.categoriesAndProductsLoaded(
          categories: categoriesList,
          products: productsList,
        ));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  void searchProducts(String searchTerm) async {
    emit(const HomeState.loading());

    final productsResponse = await _homeRepo.getProducts(
      searchTerm: searchTerm,
      category: selectedCategoryId,
    );

    productsResponse.when(
      success: (productsData) {
        productsList = productsData.items ?? [];
        emit(HomeState.categoriesAndProductsLoaded(
          categories: categoriesList,
          products: productsList,
        ));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }
}
