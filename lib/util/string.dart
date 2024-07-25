String getLastWord(String input) {
  final words = input.split(' ');
  return words.isNotEmpty ? words.last : '';
}

String getMatchStatus(String statusShort) => switch (statusShort) {
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
    switch (statusShort) {
      'TBD' || 'NS' => '---',
      '1H' || '2H' || 'ET' => '$minutes',
      'FT' || 'AET' || 'PEN' => 'FT',
      _ => statusShort,
    };
