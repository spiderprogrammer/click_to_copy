import 'package:click_to_copy/click_to_copy.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  String pasteValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Click to Copy'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Type...',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your text to copy';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    _formKey.currentState!.validate();
                    _formKey.currentState!.save();
                    if (_controller1.text.trim().isNotEmpty) {
                      // Example to copy data to Clipboard
                      await ClickToCopy.copy(_controller1.text.trim());
                    }
                  },
                  child: const Text('Click to Copy'),
                ),
                TextFormField(
                  enabled: false,
                  controller: _controller2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintText: 'Paste from clipboard',
                  ),
                  validator: (value) {},
                ),
                TextButton(
                  onPressed: () async {
                    // Example to paste data copied from Clipboard to TextFormField
                    await ClickToCopy.paste().then((value) {
                      if (value.isNotEmpty) {
                        _controller2.text = value.trim();
                      } else {
                        _controller2.text = '';
                      }
                      setState(() {});
                    });
                  },
                  child: const Text('Click to Paste'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
