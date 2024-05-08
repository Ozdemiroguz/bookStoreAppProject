// ignore_for_file: avoid_classes_with_only_static_members

abstract final class Endpoints {
  static const baseUrl = "https://assign-api.piton.com.tr/api/rest";

  static const login = "$baseUrl/login";
  static const register = "$baseUrl/register";
  static const categories = "$baseUrl/categories";
  static String booksByCategory({required int categoryId}) =>
      "$baseUrl/products/$categoryId";
  static const  bookImage = "$baseUrl/cover_image";
}
