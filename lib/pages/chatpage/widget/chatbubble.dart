import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final String status;
  final bool iscomming;
  final String time;
  final String imgUrl;

  const Chatbubble({
    super.key,
    required this.message,
    required this.status,
    required this.iscomming,
    required this.time,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        crossAxisAlignment:
        iscomming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment:
            iscomming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              if (!iscomming) Spacer(),
              Flexible(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.65,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(10),
                      bottomLeft:
                      iscomming ? Radius.circular(0) : Radius.circular(10),
                      bottomRight:
                      iscomming ? Radius.circular(10) : Radius.circular(0),
                    ),
                  ),child: imgUrl == ''
                    ? Text(
                  message,
                  style: TextStyle(fontSize: 16),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 180,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      message,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                ),
              ),
              if (iscomming) Spacer(),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment:
            iscomming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              if (!iscomming) ...[
                SizedBox(width: 4),
                Icon(
                  Icons.done_all_outlined,
                  size: 16,
                  color: status == 'seen' ? Colors.blue : Colors.grey,
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
