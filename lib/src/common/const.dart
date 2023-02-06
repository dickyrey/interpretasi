class Const {
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space15 = 15;
  static const double space25 = 25;
  static const double space50 = 50;
  static const double radius = 8;
  static const double margin = 18;
  
  static const String token = 'access_token';
  static const String host = 'api.interpretasi.id';
  static const String scheme = 'https';
  static const String unusedPath = 'https://api.interpretasi.id/v1/article/';
  static const String photo = 'https://i.pinimg.com/564x/57/70/f0/5770f01a32c3c53e90ecda61483ccb08.jpg';
}

class Assets {
  // SVG Assets
  static const String error = 'assets/error.svg';
  static const String fire = 'assets/fire.svg';
  static const String google = 'assets/google.svg';
  static const String logo = 'assets/logo.svg';
  static const String read = 'assets/read.svg';
  static const String write = 'assets/write.svg';

  // JSONS Assets
  static const String emailVerification = 'jsons/email_verification.json';
}

class ExceptionMessage {
  static const String internetNotConnected = 'internet-not-connected';
  static const String wrongOldPassword = 'wrong-old-password';
  static const String invalidToken = 'invalid-token';
  static const String userAlreadyExist = 'user-already-exist';
  static const String wrongPassword = 'wrong-password';
  static const String userNotFound = 'user-not-found';
  static const String signInCancelled = 'sign-in-cancelled';
}
