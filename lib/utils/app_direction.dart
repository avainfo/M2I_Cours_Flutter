enum AppDirection {
  left(name: "left", offset: -300),
  right(name: "right", offset: 300)
  ;

  const AppDirection({required this.name, required this.offset});

  final String name;
  final int offset;
}
