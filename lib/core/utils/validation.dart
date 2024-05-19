class MyValidation {
  String? nameValidate(String? input) {
    if ((input?.length ?? 0) > 2) {
      return null;
    }
    return "invalid name";
  }

  String? phoneValidate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegex = RegExp(r'^01[0-2][0-9]{8}$');

    if (!phoneRegex.hasMatch(input)) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }

  String? mailValidate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter an email';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(input)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? OrderNameValidate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a order name ';
    }
    final orderNameRegex = RegExp(r'^[A-Za-z0-9\s-]+$');

    if (!orderNameRegex.hasMatch(input)) {
      return 'Please enter a valid order name ';
    }

    return null;
  }

}
