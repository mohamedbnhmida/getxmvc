class Error {
  final String message;

  Error({required this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(message: json['message']);
  }
}