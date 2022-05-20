class SelectableItem {
  final int id;
  late final String title;

   SelectableItem({
    required this.id,
    required this.title,
  });

  SelectableItem fromJson(Map<String, dynamic> json) => SelectableItem(
    id: json["id"] as int,
    title: json["title"] as String,
  );

  int getTitleAsInt() => int.parse(title);
}
