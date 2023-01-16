import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 48, 75, 209),
      title: const Text('Add Item'),
      content: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(1, 2)),
                ]),
            child: _loginForm(),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Card(
      color: const Color.fromARGB(201, 43, 70, 206),
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2.5, bottom: 5),
              child: const TextField(
                onChanged: null,
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  label: Text('Item Name'),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: const TextField(
                onChanged: null,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  label: Text('Price'),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0.0, 3.0),
                  ),
                ],
              ),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 0, 0, 0),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () {},
                child: const Text('Add Item!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
