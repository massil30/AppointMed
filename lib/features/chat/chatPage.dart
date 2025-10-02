import 'package:chat_package/chat_package.dart';
import 'package:chat_package/components/message/text_message/text_message_widget.dart';
import 'package:chat_package/models/chat_message.dart';
import 'package:chat_package/models/media/chat_media.dart';
import 'package:chat_package/models/media/media_type.dart';
import 'package:flutter/material.dart';
import 'package:responsivity/utils/theme_extention.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final messages = [
    ChatMessage(text: 'hi omar', isSender: true),
    ChatMessage(text: 'hello', isSender: false),
    ChatMessage(
      isSender: true,
      text: 'this is a banana',
      chatMedia: const ChatMedia(
        url:
            'https://images.pexels.com/photos/7194915/pexels-photo-7194915.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
        mediaType: MediaType.imageMediaType(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: context.primary, // Blue background
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Dr. Olivia Turner",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.call, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.videocam, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: ChatScreen(
        activeAudioSliderColor: context.primary,
        senderColor: context.secondary,
        messages: messages,
        scrollController: ScrollController(),
        onRecordComplete: (audioMessage) {
          messages.add(audioMessage);
          setState(() {});
        },
        onImageSelected: (imageMessage) {
          messages.add(imageMessage);
          setState(() {});
        },
        textEditingController: textEditingController,
        onTextSubmit: (textMessage) {
          messages.add(textMessage);
          setState(() {});
        },
      ),
    );
  }
}
