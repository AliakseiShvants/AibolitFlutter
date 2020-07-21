class Program {
  final String logo;
  final String title;
  final String company;
  final String program;

  Program({this.logo, this.title, this.company, this.program});

  @override
  bool operator ==(other) {
    return this.title == (other as Program).title;
  }
}