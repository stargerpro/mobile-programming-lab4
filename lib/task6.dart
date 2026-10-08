import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PickerScreen(),
    );
  }
}

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  double volume = 50;
  DateTime? selectDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pickers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Volume: ${volume.round()}%',style:const TextStyle(fontSize : 24)),
            Slider(
              value : volume,
              min: 0,
              max: 100,
              onChanged: (newValue) {
                setState(() {
                  volume = newValue;
                });
              },
            ),
            Text(
              selectDate == null
              ? 'No date chosen'
              : '${selectDate!.day}/${selectDate!.month}/${selectDate!.year}',
            ),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate : DateTime(2000),
                  lastDate: DateTime(2100),
                );
               if(picked !=null) {
                 setState(() {
                   selectDate = picked;
                 });
               }
              },
              child: const Text('Pick a date'),
            ),
          ],
        ),
      ),
    );
  }
}