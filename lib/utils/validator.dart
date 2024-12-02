class Validator{

  String? isEmail(String? em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    if(regExp.hasMatch(em!) != true) {
      return "invalid a 🙄 valid email";
    }

    return null;
  }


  String? isPhoneNumber(String value) {
    if (value.length > 10 || value.length < 10) {
      return 'Mobile Number must 🙄 be of 10 digit';
    } else {
      return null;
    }
  }

  String? isPass(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 8) {
      return 'password must be 🙄 of 8 digit';
    } else {
      return null;
    }
  }

  String? isCorrectPass(pass, repass) {
    if (pass == repass) {
      return null;
    } else {
      return 'password do not 🙄 matct';
    }
  }

  String? isblank(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty == true) {
      return 'fill 🙄 name';
    } else {
      return null;
    }
  }

}