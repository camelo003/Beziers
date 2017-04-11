int marginLeft = 100;
int marginRight = 100;
int marginTop = 100;
int marginBottom = 20;

int lineParts = 15;
String frameFolder = "";
int frameCounter = 0;

BezierManager manager = new BezierManager();

void setup()
{
  size(800, 800);
  background(255);
  colorMode(HSB);
}

void mouseClicked()
{
  manager.CreateShape();
}

void draw()
{
  if (!manager.HasShape)
    return;

  manager.AnimateShape();
  manager.DrawShape();    
  SaveShape();
}

void SaveShape()
{
  frameCounter++;    
  save(frameFolder + "\\" + nf(frameCounter, 4) + ".png");
}