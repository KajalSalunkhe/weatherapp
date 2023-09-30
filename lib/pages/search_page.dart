import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  String? _cityName;
  bool isValid = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _submit() async {
    setState(() {
      isValid = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (context.mounted) {
        Navigator.of(context).pop(_cityName?.trim());
      }
    } else {
      setState(() {
        isValid = false;
        autovalidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.65),
            child: Image.asset(
              'assets/images/sun.png',
              height: 160,
              width: 160,
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'City Name',
                      hintText: 'Enter City Name',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) {
                      if (value != null) {
                        if (value.isEmpty || value.trim().length < 2) {
                          return 'Please enter a valid city';
                        }
                      }
                      return null;
                    },
                    onSaved: (String? input) {
                      _cityName = input;
                    },
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: isValid
                        ? const SizedBox.shrink()
                        : const Icon(Icons.search),
                    label: isValid
                        ? const SizedBox(
                            height: 28,
                            width: 28,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            "Search",
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
