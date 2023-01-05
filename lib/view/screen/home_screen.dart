import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtbox/model/job/job_list.dart';
import 'package:thoughtbox/model/location/locaion.dart';
import 'package:thoughtbox/services/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Location> listLocation = [];
  List<JobList> jobList = [];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      var list = await ApiServices().getAllLocation();

      var listofJob = await ApiServices().getJobList();
      if (list == null) {}
      if (listofJob == null) {}
      setState(() {
        listLocation.addAll(list!);
        jobList.addAll(listofJob!);
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Job List',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text(
              'JobLoaction',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: CupertinoSearchTextField(
                  placeholder: 'Search Job Locations',
                ),
              ),
              Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return listLocation.isEmpty
                        ? const CupertinoActivityIndicator()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 1,
                            ),
                            child: Container(
                              color: Colors.primaries[index],
                              child: ListTile(
                                title: Text(listLocation[index].place!),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return jobList.isEmpty
                      ? const CupertinoActivityIndicator()
                      : Container(
                          child: ListTile(
                            leading: Image.network(jobList[index].image!),
                            title: Text(jobList[index].position!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(jobList[index].company!),
                                Text(jobList[index].location!),
                                Text(jobList[index].skillsRequired!),
                              ],
                            ),
                            trailing: Text(jobList[index].date!),
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
