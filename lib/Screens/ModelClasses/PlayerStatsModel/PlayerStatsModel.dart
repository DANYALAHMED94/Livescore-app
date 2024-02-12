class PlayerStatistics {
  final String teamName;
  final String teamLogo;
  final int goals;
  final int assets;
  final int yellowCards;
  final int redCards;

  PlayerStatistics({
    required this.teamName,
    required this.teamLogo,
    required this.goals,
    required this.assets,
    required this.yellowCards,
    required this.redCards
  });

  factory PlayerStatistics.fromJson(Map<String, dynamic> json) {

    final statistics = json['statistics'][0];

    return PlayerStatistics(
      teamName: statistics['team']['name'],
      teamLogo: statistics['team']['logo'],
      goals: statistics['goals']['total'],
      assets: statistics['goals']['assists'],
      yellowCards: statistics['cards']['yellow'],
      redCards: statistics['cards']['red'],
    );
  }
}
