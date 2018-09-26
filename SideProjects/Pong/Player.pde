public class Player {

  String name;
  color playerColor;
  int score;

  public Player(String name, color playerColor, int score){
    this.name = name;
    this.playerColor = playerColor;
    this.score = score;
  }

  void scoreInc(){
    score++;
  }

  int getScore(){
    return score;
  }

  void setScore(int point){
    score = point;
  }

  String scoreInText(){
      String score1 = "zero";
      int points = score + 1;
      switch (points){
          case 1:  score1 = "zero";
          break;
          case 2:  score1 = "one";
          break;
          case 3:  score1 = "two";
          break;
          case 4:  score1 = "three";
          break;
          case 5:  score1 = "four";
          break;
          case 6:  score1 = "five";
          break;
          case 7:  score1 = "six";
          break;
          case 8:  score1 = "seven";
          break;
          case 9:  score1 = "eight";
          break;
          case 10:  score1 = "nine";
          break;
          case 11:  score1 = "ten";
          break;
      }
      return score1;
  }
}
