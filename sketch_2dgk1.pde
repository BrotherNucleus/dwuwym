PObjectK object;
PVector position;
PVector size;

mapInterpreter map;

PObjectM object2;
PVector position2;
PVector size2;

int cameraSizeX = 1280;
int cameraSizeY = 750;

PVector cameraCenter;

PVector bgColor;

PVector center;

Object[] objects;

cameraController ctrl;

void setup()
{
  size(1280, 720, P3D);
  noStroke();
  position = new PVector(100, 220);
  size = new PVector(120, 120);
  object = new PObjectK(position, true, "ptpn.png", size);
  cameraCenter = new PVector(ceil((cameraSizeX / 50) / 2 ), ceil((cameraSizeY / 50) / 2));
  position2 = new PVector(600, 220);
  size2 = new PVector(120, 220);
  object2 = new PObjectM(position2, false, "zgttn.png", size);
  objects = new Object[] {object, object2};
  bgColor = new PVector(152,190,100);
  map = new mapInterpreter("map.txt", cameraCenter, objects, bgColor);
  center = new PVector(1280/2, 720/2);
  ctrl = new cameraController(center, object, map);
  background(152,190,100);
  pushMatrix();
    //scale(0.5);
    map.loadMap();
   popMatrix();
   print(center.x - object.position.x);
}

void draw(){
  //scale(0.5);
  map.loadPartially();
  ctrl.drawSquareOnfollow();
  ctrl.updateCamera();
  //ctrl.CameraFollowConst();
    object.display();
  object2.display();
}

void keyPressed() {
  print("pressed: ");
  if(keyCode == 'D') {
    object.pressKey('D');
    print("D");
  }
   else if(keyCode == 'A') {
    object.pressKey('A');
    print("A");
  }
  print(" Key\n");
}

void keyReleased() {
  print("released: ");
  if(keyCode == 'D') {
    object.releaseKey('D');
    print("D");
  }
   else if(keyCode == 'A') {
    object.releaseKey('A');
    print("A");
  }
  print(" Key\n");
}
