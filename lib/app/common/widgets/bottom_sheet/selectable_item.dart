class SelectableItem {
  final int id;
  final String title;

  int getTitleAsInt() => int.parse(title);

  const SelectableItem({
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectableItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title);

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'SelectableItem{ id: $id, title: $title,}';
  }
}
