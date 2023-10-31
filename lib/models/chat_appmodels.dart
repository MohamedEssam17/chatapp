import 'package:chatapp/widgets/contans.dart';

class Message
{
  final String message;
final String id;
  Message(  this.message ,  this.id);
  factory Message.fromjson(json)
  {
    return Message( json[Kmessage] ,json["id"] );
  }
}