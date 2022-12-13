class ResponseSuccessRequest {
  final String message;
  final bool success;
  final dynamic? values;

  const ResponseSuccessRequest({
    this.message = '',
    this.success = false,
    this.values,
  });
}