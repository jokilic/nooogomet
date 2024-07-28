String getLastWord(String input) {
  final words = input.split(' ');
  return words.isNotEmpty ? words.last : '';
}

String getMatchStatus(String statusShort) => switch (statusShort.toUpperCase()) {
      'TBD' => 'Scheduled but date and time are not known',
      'NS' => 'Not started',
      '1H' => 'First half',
      'HT' => 'Half time',
      '2H' => 'Second half',
      'ET' => 'Extra time',
      'BT' => 'Break during extra time',
      'P' => 'Penalties played after extra time',
      'SUSP' => "Suspended by referee's decision, may be rescheduled another day",
      'INT' => "Interrupted by referee's decision, should resume in a few minutes",
      'FT' => 'Finished in regular time',
      'AET' => 'Finished after extra time',
      'PEN' => 'Finished after penalty shootout',
      'PST' => 'Postponed to another day',
      'CANC' => 'Cancelled',
      'ABD' => 'Abandoned',
      'AWD' => 'Technical loss',
      'WO' => 'Victory by forfeit or absence of competitor',
      'LIVE' => 'In progress',
      _ => 'Unknown',
    };

String getMatchStatusMinutes({
  required String statusShort,
  required int minutes,
}) =>
    switch (statusShort.toUpperCase()) {
      'TBD' || 'NS' => '---',
      '1H' || '2H' || 'ET' => '$minutes',
      'FT' || 'AET' || 'PEN' => 'FT',
      _ => statusShort,
    };

String getEventText({
  required String eventType,
  required String eventDetail,
}) =>
    switch (eventType.toLowerCase()) {
      'goal' => switch (eventDetail.toLowerCase()) {
          'normal goal' => 'Goal',
          'own goal' => 'Own goal',
          'penalty' => 'Penalty',
          'missed penalty' => 'Missed penalty',
          _ => 'Goal',
        },
      'card' => switch (eventDetail.toLowerCase()) {
          'yellow card' => 'Yellow card',
          'red card' => 'Red card',
          _ => 'Card',
        },
      'subst' => 'Substitution',
      'var' => switch (eventDetail.toLowerCase()) {
          'goal cancelled' => 'Goal cancelled',
          'penalty confirmed' => 'Penalty confirmed',
          _ => 'VAR',
        },
      _ => '---',
    };
