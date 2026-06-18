/// 音符每小节的拍号
enum ProjectBeats {
  twoFour('2/4'),
  threeFour('3/4'),
  fourFour('4/4'),
  twoTwo('2/2'),
  threeEight('3/8'),
  sixEight('6/8'),
  oneFour('1/4'),
  fiveFour('5/4'),
  sevenEight('7/8'),
  nineEight('9/8'),
  twelveEight('12/8');

  final String beats;

  const ProjectBeats(this.beats);
}
