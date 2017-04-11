public class BezierPart
{

  PVector controlPoint1;
  PVector controlPoint2;
  PVector anchorPoint;

  public BezierPart()
  {
  }

  public BezierPart(float c1x, float c1y, float c2x, float c2y, float ax, float ay)
  {
    controlPoint1 = new PVector(c1x, c1y);
    controlPoint2 = new PVector(c2x, c2y);
    anchorPoint = new PVector(ax, ay);
  }

  float point1Offset = random(-100, 100);
  float point1Delta = random(0.1, 2);
  public void AnimatePoint1()
  {
    point1Offset += point1Delta;
    controlPoint1.x +=  2 * (noise(point1Offset) - 0.5);
    controlPoint1.y +=  2 * (noise(point1Offset + point1Delta) - 0.5);    
  }

  float point2Offset = random(1000, 1200);
  float point2Delta = random(1, 1.6);
  public void AnimatePoint2()
  {
    point2Offset += point2Delta;
    controlPoint2.x += 0.5 * (noise(point2Offset) - 0.5);
    controlPoint2.y += 0.5 * (noise(point2Offset + point2Delta) - 0.5);
  }

  float anchorOffset = 0.1;
  float anchorDelta = 0.1;
  public void AnimateAnchor()
  {
    anchorOffset += anchorDelta;
    anchorPoint.x += 0.5 * (noise(anchorOffset) - 0.5);
    anchorPoint.y += 0.5 * (noise(anchorOffset + anchorDelta) - 0.5);
  }
}