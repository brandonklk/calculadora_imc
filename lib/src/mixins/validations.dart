mixin InputMixin {
  String? isNotEmpty(String? value, [String? message]) {
    String? messageError;
    const String messageDefault = "Esse campo é obrigatório";

    if (value!.isEmpty) {
      messageError = message ?? messageDefault;
    }

    return messageError;
  }

  String? combineRules(List<String? Function()> validation) {
    String? validationFunc;

    for (final func in validation) {
      validationFunc = func();

      if (validationFunc != null) {
        return validationFunc;
      }
    }

    return validationFunc;
  }
}
