import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FootballLeagueNotificationsIconsReplacer extends GetxController{

  RxList selectedTeamIds = [].obs;

  addToFavouriteMethod(String id){
    selectedTeamIds.add(id);
  }

  removeFromFavouriteMethod(String id){
    selectedTeamIds.remove(id);
  }



}