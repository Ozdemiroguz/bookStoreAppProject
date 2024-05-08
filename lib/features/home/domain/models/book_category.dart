class BookCategory {
  final int id;
  final String name;
  String created_at;


  BookCategory({
    required this.id,
    required this.name,
    required this.created_at,
  });

  List<Object?> get props => [id, name, created_at];
}
