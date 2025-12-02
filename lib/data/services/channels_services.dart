import 'package:m2i_cours_flutter/utils/http_extension_helper.dart';
import 'package:m2i_cours_flutter/utils/response_extension.dart';

import '../models/channel.dart';

class ChannelsServices with HttpExtensionHelper {
  Future<List<Channel>> getChannels(String serverId) async {
    final List<Channel> channels = [];
    final response = await getJsonApi(endpoints: "/servers/$serverId/channels");
    if (!response.succeed || response.jsonBody == null) return [];
    for (final channel in response.jsonBody) {
      channels.add(Channel.fromJson(channel));
    }
    return channels;
  }
}
