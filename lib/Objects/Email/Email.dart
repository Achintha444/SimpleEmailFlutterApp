import 'package:email_flutter_app/Objects/Email/EmailSingle.dart';
import 'package:email_flutter_app/Objects/User.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email {
  String _recipentEmail;
  String _subject;
  String _body;
  //EmailSingle _emailSingle;

  Email({String recipentEmail, String subject, String body}) {
    this._recipentEmail = recipentEmail;
    this._subject = subject;
    this._body = body;
    //this._setEmailSingle();
  }

  // void _setEmailSingle(){
  //   this._emailSingle = EmailSingle.getInstance;
  // }

  SmtpServer _getSmtpServer() {
    return gmail(User.getInstance.getEmail, User.getInstance.getPassword);
  }

  Future<bool> sendEmail() async {
    final message = Message()
      ..from = Address(User.getInstance.getEmail)
      ..recipients.add(this._recipentEmail)
      ..subject = this._subject
      ..text = this._body;

    try {
      final sendReport = await send(message, _getSmtpServer());
      print ("addadas");
      return true;
    } on MailerException catch (e) {
      print('Message not sent.');
      print (e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
      
    }
  }
}
