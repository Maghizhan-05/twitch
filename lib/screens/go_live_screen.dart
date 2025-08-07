import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:twitch/utils/colors.dart';
import 'package:twitch/widgets/buttons.dart';
import 'package:twitch/widgets/textfield.dart';

class goLiveScreen extends StatefulWidget {
  const goLiveScreen({super.key});

  @override
  State<goLiveScreen> createState() => _goLiveScreenState();
}

class _goLiveScreenState extends State<goLiveScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    color: buttonColor,
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: buttonColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.folder_open, color: buttonColor, size: 40),
                          const SizedBox(height: 15),
                          Text(
                            "Select your Thumbnail",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: customTextField(controller: _titleController),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: customButton(text: "Go Live", onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
