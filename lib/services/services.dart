import 'dart:developer';

import 'package:http/http.dart';
import 'package:thoughtbox/model/job/job_list.dart';
import 'package:thoughtbox/model/location/locaion.dart';
import 'package:thoughtbox/services/api/api_url.dart';

class ApiServices {
  Future<List<Location>?> getAllLocation() async {
    String json = '';
    try {
      Client client = Client();
      Uri uri = Uri.parse(locstionURl);
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        json = response.body;
        return locationFromJson(json);
      }
    } catch (e) {
      log('$e error thrown');
    }
    return locationFromJson(json);
  }

  Future<List<JobList>?> getJobList() async {
    String json = '';
    try {
      Client client = Client();
      Uri uri = Uri.parse('$baseURL$apiKEY');
      Response response = await client.get(uri);
      log('hai');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('message');
        json = response.body;
        return jobListFromJson(json);
      }
    } catch (e) {
      log('$e error thrown');
    }
    return jobListFromJson(json);
  }
}
