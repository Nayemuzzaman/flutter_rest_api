class QP {
  const QP._();
  static Map<String, String> apiQP(
          {required String apiKey, required String country}) =>
      {
        'counntry': country,
        'apiKey':apiKey
      };
}
