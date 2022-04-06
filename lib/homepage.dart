import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/taskall.dart';
import 'package:flutter_application_1/widget/taskin.dart';
import 'package:flutter_application_1/widget/tasksuccess.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _tab = [const TaskSuccess(), const TaskAll(), const TaskIn()];
    return Scaffold(
      body: IndexedStack(
        children: _tab,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Complete",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox),
            label: "All",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Incomplete",
          ),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
