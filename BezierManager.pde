public class BezierManager
{
  PVector startPoint;
  ArrayList<BezierPart> bezierParts;
  boolean HasShape = false;  
  IntList moveIndices = new IntList();

  public BezierManager()
  {
  }

  public void AnimateShape()
  {
    for (int i : moveIndices)
    {
      BezierPart bp = bezierParts.get(i);
      bp.AnimatePoint1();
      bp.AnimatePoint2();
    }
  }

  public void CreateShape()
  {
    startPoint = new PVector(width/2, height/2);
    bezierParts = new ArrayList<BezierPart>();
    moveIndices = new IntList();

    frameFolder = nf(year(), 2) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + nf(millis(), 2);
    frameCounter = 0;

    float control1x = random(marginLeft, width-marginRight);
    float control1y = random(marginTop, height-marginBottom);

    for (int i=0; i<lineParts; i++)
    {
      if (random(0, 100) < 20) moveIndices.append(i);

      float control2x = random(marginLeft, width-marginRight);
      float control2y = random(marginTop, height-marginBottom);

      float anchor2x = random(marginLeft, width-marginRight);
      float anchor2y = random(marginTop, height-marginBottom);

      BezierPart bp = new BezierPart(control1x, control1y, control2x, control2y, anchor2x, anchor2y);
      bezierParts.add(bp);

      control1x = control2x;
      control1y = control2y;
    }

    // Define appearance
    stroke(random(0, 255), random(40, 200), random(40, 200));
    strokeWeight(random(0.5, 2.8));  
    noFill();

    HasShape = true;
  }

  public void DrawShape()
  {    
    background(255);

    // Start the shape
    beginShape();
    vertex(startPoint.x, startPoint.y);

    // Draw the bezier parts
    for (BezierPart bp : bezierParts)
    {
      bezierVertex(bp.controlPoint1.x, bp.controlPoint1.y, bp.controlPoint2.x, bp.controlPoint2.y, bp.anchorPoint.x, bp.anchorPoint.y);
    }

    // End the shape
    endShape();
  }
}