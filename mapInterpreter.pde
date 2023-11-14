public class mapInterpreter {
  public String[] strMap;
  PVector pos;
  int size = 50;
  boolean isTileTextured = true;
  PVector sizeV = new PVector(size, size);
  PVector centerCamera;
  Object[] objs;
  PVector bg;
  
  public mapInterpreter(String path, PVector center, Object[] objects, PVector bgColor) {
    strMap = loadStrings(path);
    pos = new PVector(0, 0);
    centerCamera = center;
    objs = objects;
    bg = bgColor;
  }
  
  public void logTxtMap() {
    for(int i = 0; i < strMap.length; i++) {
      println(strMap[i]);
    }
  }
  
  public void loadPartially() {
    boolean first = true;
    for(int i = 0; i < objects.length; i++) {
      if(objects[i].moves) {
        int Ox = floor(objects[i].position.x / size);
        int Oy = floor(objects[i].position.y / size);
        if (Ox < 1) {
          Ox = 0;
          print(strMap.length);
        }
        if (Oy < 1) {
          Oy = 0;
        }
        if (Ox > int(strMap[0].toCharArray().length) - 4) {
          Ox = int(strMap[0].toCharArray().length - 4);
        }
        if (Oy > int(strMap.length) - 4) {
          Oy = int(strMap.length - 4);
        }
        pushMatrix();
          for(int y = Oy; y < Oy + 4; y++) {
          first = true;
          char[] line = strMap[y+int(cameraCenter.y - 7)].toCharArray();
            pushMatrix();
              for(int x = Ox; x < Ox + 4; x++) {
                char type = line[x+int(cameraCenter.x - 12)];
                if(first) {
                  pos.x = x*size;
                  pos.y = y*size;
                } else {
                  pos.x = size;
                  pos.y = 0;
                }
                String path = readType(type);
                  tileObject tile = new tileObject(pos, false, path, sizeV, bg);
                  tile.display();
                first = false;
              }
              
            popMatrix();
          }
        popMatrix();
      }
    }
  }
  
  public String readType(char type) {
    String path;
    switch (type){
          case '/':
          path = "bricks.jpg";
          break;
          case '\\':
          path = "grass.jpg";
            break;
          case '-':
          path = "rock.jpg";
            break;
          case '.':            
            path = "steel.jpg";
            break;
           case '|':
              path = "wood.jpg";
              break;
          default:
            path = " ";
            isTileTextured = false;
          break;
        }
        return path;
  }
 
  
  public void loadMap() {
    background(152,190,100);
    pushMatrix();
    translate(-size, 0);
    for(int i = 0; i < strMap.length; i++) {
      char[] line = strMap[i].toCharArray();
      pushMatrix();
      for(int b = 0; b < line.length; b++) {
        isTileTextured = true;
        char type = line[b];
        pos.x = size;
        pos.y = 0;
        String path = readType(type);
        if(isTileTextured){
          tileObject tile = new tileObject(pos, false, path, sizeV, bg);
          tile.display();
        } else {
          translate(size, 0);
        }
      }
      popMatrix();
      translate(0, size);
    }
    popMatrix();
  }
}
