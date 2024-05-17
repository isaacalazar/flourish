class CustomException implements Exception {
  final String customMessage;

//add error code handling

  const CustomException(
    this.customMessage,
  );
}
