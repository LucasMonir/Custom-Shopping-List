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
      title: const Text(
        'Add Item',
        style: TextStyle(
          shadows: [
            Shadow(
              blurRadius: 5,
              color: Colors.black,
              offset: Offset(1, 2),
            ),
          ],
        ),
      ),
      content: Stack(
        children: [
          Container(
            height: 210,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _loginForm(),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Column(
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
            bottom: 20,
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
              overlayColor: MaterialStatePropertyAll(
                Color.fromARGB(131, 164, 223, 255),
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
    );
  }
}
