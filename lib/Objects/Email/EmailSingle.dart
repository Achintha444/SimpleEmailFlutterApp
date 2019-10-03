import 'package:email_flutter_app/Objects/User.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/smtp_server.dart';

@protected
class EmailSingle {
  SmtpServer _smtpServer;
  static EmailSingle _instance;

  _EmailSingle() {
    this._smtpServer =
        gmail(User.getInstance.getEmail, User.getInstance.getPassword);
  }

  static EmailSingle get getInstance {
    if (_instance == null) {
      EmailSingle._instance = new EmailSingle();
    }
    return EmailSingle._instance;
  }

  // SmtpServer getSmtpServer() {
  //   return gmail(_userEmail, _password);
  // }

  SmtpServer getSmtpServer() {
    return EmailSingle._instance._smtpServer;
  }
}
