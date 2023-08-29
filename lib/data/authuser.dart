import 'dart:math';

import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://127.0.0.1:8090');

authUser() async {
  try {
    await pb.collection('users').authWithPassword('reza_asong', '12345');
    print(pb.authStore.token);
  } on ClientException catch (error) {
    print('Error: ${error.response['message']} ==> ${error.response['data']}');
  }
}

createRecord() async {
  final body = <String, dynamic>{
    "content": "${Random().nextInt(300000)}",
    "channellink": "test",
    "datetime": "test",
    "field": "Dollar"
  };

  try {
    var response = await pb.collection('Narkuab').create(body: body);
    print(pb.authStore.isValid);
    print(response.data);
  } on ClientException catch (error) {
    print('Error: ${error.response['message']} ==> ${error.response['data']}');
  }
}

Future<List<RecordModel>?> getNarkuabList() async {
  await authUser();

  try {
    final resultList = await pb.collection('Narkuab').getFullList(
          sort: '-created',
        );

    return resultList;
  } on ClientException catch (error) {
    print('Error: ${error.response['message']} ==> ${error.response['data']}');
    return null;
  }
}
