class PlaceSearch {
  final String description;
  final String placedId;

  PlaceSearch({required this.description, required this.placedId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      description: json['description'],
      placedId: json['placed_id'],
    );
  }
}
