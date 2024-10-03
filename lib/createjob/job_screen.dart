import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/createjob/job_model.dart';
import 'package:practice/createjob/job_service.dart';
import 'package:practice/login/home_screen.dart';
import 'package:practice/login/login_model.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  JobModel jobModel = JobModel();

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(labelText: 'Job'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your job';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    JobService()
                        .createJob(_nameController.text.toString(),
                            _jobController.text.toString())
                        .then((value) {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        jobModel = value!;
                        // Process data
                      });

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => HomeScreen(
                                    created: jobModel.createdAt.toString(),
                                    id: jobModel.id.toString(),
                                    job: jobModel.job.toString(),
                                    name: jobModel.name.toString(),
                                  )));
                    }).onError((error, stackTrace) {
                      print(error);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid Fields')),
                      );
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
