mixin Validation {
  emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "E-Mail Required";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return "Invalid E-Mail";
    } else {
      return null;
    }
  }

  passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return "Password Required";
    } else {
      return null;
    }
  }

  nameValidation(value) {
    if (value == null || value.isEmpty) {
      return "Name Required";
    } else {
      return null;
    }
  }

  regNameValidation(value) {
    if (value == null || value.isEmpty) {
      return "Name Required";
    } else {
      return null;
    }
  }
}
