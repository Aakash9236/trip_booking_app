class Trip {
  final int id;
  final String title;
  final String date;
  final String pickup;
  final String drop;
  String status;
  Trip({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.pickup,
    required this.drop,
  });
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip( id: json["id"],
      title: json["title"],
      date: json["date"],
      status: json["status"],
      pickup: json["pickup"],
      drop: json["drop"],
    );
  }
}