abstract class DetailedException implements Exception {
  final String? message;
  const DetailedException({
    this.message,
  });
}

class ServerException extends DetailedException {}
