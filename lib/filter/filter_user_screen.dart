import 'package:flutter/material.dart';
import 'package:practice/filter/filter_user_model.dart';
import 'package:practice/filter/filter_user_services.dart';

class FilterUserScreen extends StatefulWidget {
  const FilterUserScreen({super.key});

  @override
  State<FilterUserScreen> createState() => _FilterUserScreenState();
}

class _FilterUserScreenState extends State<FilterUserScreen>
    with SingleTickerProviderStateMixin {
  bool isready = false;
  UsersList usersList = UsersList(users: []);
  filterUserList() {
    setState(() {
      isready = true;
    });
    FilterUserServices().filterUserService().then((value) {
      // print(value!.users![0].gender);
      _forMale(value!.users!);
      _forFemale(value!.users!);
      setState(() {
        isready = false;
        usersList = value!;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  ///------------ for male --------------

  List<Users> male = [];
  List<Users> _forMale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "male") {
        male.add(element);
      }
    }
    return male;
  }

  ///------------ for female --------------

  List<Users> female = [];
  List<Users> _forFemale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "female") {
        female.add(element);
      }
    }
    return female;
  }

  late TabController _tabController;

  @override
  void initState() {
    filterUserList();
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Users'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Male'),
            Tab(text: 'Female'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMaleScreen(),
          _buildFemaleScreen(),
        ],
      ),
    );
  }

  Widget _buildMaleScreen() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          title: Text(male[index].gender.toString()),
          subtitle: Text(male[index].firstName.toString().toUpperCase()),
        );
      },
      itemCount: male.length,
    );
  }

  Widget _buildFemaleScreen() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          title: Text(female[index].gender.toString()),
          subtitle: Text(female[index].firstName.toString().toUpperCase()),
        );
      },
      itemCount: female.length,
    );
  }
}
