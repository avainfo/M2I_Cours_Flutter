import 'package:m2i_cours_flutter/data/global_data.dart';
import 'package:m2i_cours_flutter/data/services/channels_services.dart';

import '../models/channel.dart';

class ChannelsRepo {
  static Future<List<Channel>> getChannels({
    String serverID = GlobalData.CHANNEL_ID,
  }) async {
    return await ChannelsServices().getChannels(serverID);
  }
}
