import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String name;
  final String author;
  final String cover;
  final String description;
  final double price;
  final int sales;
  final String slug;
  final String? image;

  const Book({
    required this.id,
    required this.name,
    required this.author,
    required this.cover,
    required this.description,
    required this.price,
    required this.sales,
    required this.slug,
    this.image,
  });

  @override
  List<Object?> get props =>
      [id, name, author, description, cover, price, sales, slug];


  //copyWith method
  Book copyWith({
    int? id,
    String? name,
    String? author,
    String? cover,
    String? description,
    double? price,
    int? sales,
    String? slug,
    String? image,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      cover: cover ?? this.cover,
      description: description ?? this.description,
      price: price ?? this.price,
      sales: sales ?? this.sales,
      slug: slug ?? this.slug,
      image: image ?? this.image,
    );
  }
}
