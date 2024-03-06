class RegexExpressions {
  String passregex = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";

  String emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  String phonePattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
}
