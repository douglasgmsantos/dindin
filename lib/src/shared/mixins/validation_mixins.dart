mixin ValidationMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "Este campo é obrigatório";
    }
    return null;
  }

  String? isGreaterThan(int qtdLetters, String value) {
    if (value.length > qtdLetters) {
      return "Este campo é maior que $qtdLetters caracteres.";
    }
    return null;
  }

  String? isEmailValid(value) {
    bool isValid = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
    ).hasMatch(value);

    if (!isValid) return "Este e-mail não é válido";

    return null;
  }

  String? toEqual(dynamic value, dynamic comparator, String message) {
    if (value != comparator) return message;
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var fun in validators) {
      final validation = fun();
      if (validation != null) return validation;
    }
    return null;
  }
}
