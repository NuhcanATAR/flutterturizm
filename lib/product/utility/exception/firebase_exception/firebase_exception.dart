final class FirebaseCloudFirestoreException implements Exception {
  FirebaseCloudFirestoreException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}
