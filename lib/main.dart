import 'package:flutter/material.dart';
import 'basic_widgets/scaffold_widget.dart';
import 'basic_widgets/dialog_widget.dart';
import 'basic_widgets/input_selection_widget.dart';
import 'basic_widgets/date_time_picker_widget.dart';
import 'basic_widgets/fab_widget.dart'; // Import FabWidget
import 'basic_widgets/loading_cupertino.dart'; // Import LoadingCupertino

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index untuk melacak halaman yang ditampilkan pada BottomNavigationBar
  int _selectedIndex = 0;

  // Daftar widget yang ingin ditampilkan pada masing-masing halaman
  final List<Widget> _screens = [
    const MyHomePage(title: 'Home'), // Menggunakan widget yang sesuai
    const MyLayout(),
    const InputSelectionWidget(),
    const DateTimePickerWidget(),
    const FabWidget(), // Menambahkan FabWidget
    const LoadingCupertino(), // Menambahkan LoadingCupertino
  ];

  // Fungsi untuk mengubah halaman berdasarkan index yang dipilih di BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Demo'),
      ),
      body: _screens[
          _selectedIndex], // Menampilkan halaman berdasarkan index yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Scaffold',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Dialog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Date Picker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up), // Icon untuk FabWidget
            label: 'FAB Widget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty), // Icon untuk LoadingCupertino
            label: 'Loading',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
