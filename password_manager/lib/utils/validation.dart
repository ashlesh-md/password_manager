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

  phoneNumberValidator(String value) {
    if (value == null || value.isEmpty) {
      return "Mobile-Number Required";
    } else if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
        .hasMatch(value)) {
      return "Invalid Mobile-Number";
    } else {
      return null;
    }
  }

  passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return "Password Required";
    } else if (value.length != 4) {
      return "MPin Length must be 4 digits";
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

  checkSize(value) {
    if (value == null || value.isEmpty) {
      return "Value Required";
    } else if (value.length > 100) {
      return "Size Exceded";
    } else {
      return null;
    }
  }
}
