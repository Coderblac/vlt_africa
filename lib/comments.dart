import 'package:flutter/material.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/model.dart';
import 'package:vlt_africa/responsive.dart';

class CommentsSection extends StatefulWidget {
  final VideoCourseModel course;
  const CommentsSection({super.key, required this.course});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
   final TextEditingController _messageController = TextEditingController();

    final List<Map<String, dynamic>> messages = [
    {
      'isCurrentUser': true,
      'message': 'Hello',
    },
    {
      'isCurrentUser': false,
      'message': 'Hi there!',
    },
    {
      'isCurrentUser': true,
      'message': 'Hey i have a package with you',
    },
    {
      'isCurrentUser': false,
      'message': 'Hi there! lemme see the amount of space this chat bubble would take in a lenghty message',
    },
  ];

    @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body:
      widget.course.comments!.isNotEmpty?
       GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
         child: Align(
            alignment: Alignment.center,
           child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.isMobile(context)? MediaQuery.of(context).size.width * 0.95: MediaQuery.of(context).size.width * 0.6,
              ),
             child: Column(
               children: [
                 SizedBox(
                  height: MediaQuery.of(context).size.height*0.85,
                   child: ListView.builder(
                     itemCount: widget.course.comments!.length,
                     itemBuilder: (context, index) {
                       final comment = widget.course.comments![index];
                       return ListTile(
                         leading: CircleAvatar(
                           backgroundImage: comment.userImageUrl != null
                               ? NetworkImage(comment.userImageUrl!)
                               : const AssetImage('assets/logo/logo.jpeg')
                                   as ImageProvider,
                         ),
                         title: Text(
                           comment.userName,
                           style: const TextStyle(fontWeight: FontWeight.bold),
                         ),
                         subtitle: Text(
                           comment.comment,
                           style: const TextStyle(fontWeight: FontWeight.bold),
                         ),
                       );
                     },
                   ),
                 ),
                 ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.isMobile(context)? MediaQuery.of(context).size.width * 0.95: MediaQuery.of(context).size.width * 0.6,
              ),
              child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'send a message',
                              hintStyle: TextStyle(color: CustomHexColors.fromHex(
                                            '#19715c'),),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              suffixIcon: Icon(Icons.attach_file, color: CustomHexColors.fromHex(
                                            '#19715c'),),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomHexColors.fromHex(
                                            '#19715c'),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.send, color: Colors.white),
                            onPressed: () {
                              if (_messageController.text.isNotEmpty) {
                                setState(() {
                                  messages.insert(0, {
                                    'isCurrentUser': true,
                                    'message': _messageController.text,
                                  });
                                  _messageController.clear();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
               ],
             ),
           ),
         ),
       )
      :Center(
            child: Text('No Comments Yet',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ),
          bottomNavigationBar: null
    );
  }
}