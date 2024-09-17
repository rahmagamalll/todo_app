class TodoModel {
  int? id;
  String title;
  String subTitle;
  String date;
  int color;

  TodoModel(
      {this.id,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.color});

  factory TodoModel.formJson(json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        subTitle: json['subtitle'],
        date: json['date'],
        color: json['color']);
  }
}
