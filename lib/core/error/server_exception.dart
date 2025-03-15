class ServerException implements Exception {
  final String message;

  ServerException(
      {this.message =
          'Something unexpected happened. Please try again later.'});
}
