class City {
  final int id;
  final String title;

  const City(this.id, this.title);

  @override
  bool operator ==(other) {
    return this.title == (other as City).title;
  }
}