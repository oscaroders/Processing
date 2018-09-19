public class OVector{

  float xValue;
  float yValue;

  public OVector(float xValue, float yValue){
    this.xValue = xValue;
    this.yValue = yValue;
  }

  public OVector(){
    this.xValue = xValue;
    this.yValue = yValue;
  }

  public void setAngle(float angle){
    float length = this.getLength();
    xValue = cos(angle) * length;
    yValue = sin(angle) * length;
  }

  public float getAngle(){
    return degrees(atan(yValue / xValue));
  }

  public void setlength(float length){
    float angle = this.getAngle();
    xValue = cos(angle) * length;
    yValue = sin(angle) * length;
  }

  public float getLength(){
    return sqrt(sq(xValue) + sq(yValue));
  }

  public OVector add(OVector v1){
    OVector vec = new OVector(xValue + v1.xValue, yValue + v1.yValue);
    return vec;
  }

  public OVector sub(OVector v1){
    OVector vec = new OVector(xValue - v1.xValue, yValue - v1.yValue);
    return vec;
  }

  public OVector multi(float multiplier){
    OVector vec = new OVector(xValue * multiplier, yValue * multiplier);
    return vec;
  }

  public OVector unit(){
    OVector vec = new OVector(xValue / abs(xValue), yValue / abs(yValue));
    return vec;
  }

  public float scalar(OVector vec){
    float length1 = this.getLength();
    float length2 = vec.getLength();
    float angle1 = this.getAngle();
    float angle2 = vec.getAngle();
    float angle = abs(angle1 - angle2);
    float scal = (length1 * length2 * angle);
    return scal;
  }

  public boolean isOrto(OVector vec){
    float a = this.scalar(vec);
    if(a == 0){
      return true;
    } else {
      return false;
    }
  }

}
