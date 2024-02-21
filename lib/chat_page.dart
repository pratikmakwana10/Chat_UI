import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = types.User(
    id: UniqueKey().toString(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
          scrollPhysics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          theme: DefaultChatTheme(
              // INPUT TEXTFIELD THEME
              inputTextCursorColor: Colors.red,
              inputSurfaceTintColor: Colors.yellow,
              inputBackgroundColor: Colors.white,
              inputTextColor: Colors.white,
              inputMargin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              inputTextStyle: const TextStyle(
                color: Colors.black,
              ),
              inputBorderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
              // inputTextDecoration: const InputDecoration(
              //   border: InputBorder.none,
              //   contentPadding: EdgeInsets.zero,
              //   hintText: 'Type a message',
              //   hintStyle: TextStyle(color: Colors.black54),
              // ),
              inputContainerDecoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              // OTHER CHANGES IN THEME
              primaryColor: const Color.fromARGB(255, 191, 12, 12),
              
              backgroundColor: const Color.fromARGB(255, 227, 227, 227)),
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: UniqueKey().toString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    print("Adding message: $message");
    setState(() {
      _messages.insert(0, message);
    });
  }
}
