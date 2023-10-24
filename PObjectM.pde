
public class PObjectM extends Object {
  
    private boolean moveRight = false;
  private boolean moveLeft = false;
  private boolean movedLeft = false;
  private boolean movedRight = false;
  private float smooth = 0.2;
  private int prevMouseX = 0;
  private int prevMouseY = 0;
    public PObjectM(PVector pos, boolean isMoving, String path, PVector s) {
      super(pos, isMoving, path, s);
    }
    
          public void display() {
    if(moves) {
      LorRMove();
      controller();
    }
    
    
    pushMatrix();
       translate(position.x, position.y);
       beginShape();
         texture(img);
         //second pair of numbers here must be the size of the texture
         vertex(0, 0, 0, 0);
         vertex(size.x, 0, 100, 0);
         vertex(size.x, size.y, 100, 100);
         vertex(0, size.y, 0, 100);
       endShape();
     popMatrix();
  }
  
  public void LorRMove() {
    if(mouseX > position.x + size.x) {
      moveRight = true;
      moveLeft = false;
    } else if (mouseX < position.x) {
      moveLeft = true;
      moveRight = false;
    } else {
      moveLeft = false;
      moveRight = false;
    }
  }
  
  private void controllerLerp() {
    float prevSpeed = speed;
    
    if(moveRight) {
      if(speed < targetSpeed) {
        if(speed <= 0) {
          speed = targetSpeed*0.5;
        }
        speed += speed*0.2;
        movedRight = true;
      }
    }
    else if(!moveRight && movedRight) {
      if(speed > 0) {
        speed -= speed*0.2;
      }
      if(abs(speed - prevSpeed) < 0.01) {
        speed = 0;
        movedRight = false;
      }
    } 
    if(moveLeft) {
      if(speed > -1*targetSpeed) {
        if(speed >= 0) {
          speed = -1*targetSpeed*0.5;
        }
        speed += speed*0.2;
      }
      movedLeft = true;
    } else if(!moveLeft && movedLeft) {
       if(speed < 0) {
        speed -= speed*0.2;
      }
      if(abs(speed - prevSpeed) < 0.01) {
        speed = 0;
        movedLeft = false;
      }
      
    }
    position.x += speed;
  }
  
    private void controller() {
    if(moveLeft) {
      speed = -1*targetSpeed*(1-smooth) + speed*smooth;
    }
    else if(moveRight) {
      speed = targetSpeed*(1-smooth) + speed*smooth;
    } else {
      speed -= speed*smooth;
      if(abs(speed) < 0.01) {
        speed = 0;
      }
    }
    position.x += speed;
    logMouse();
  }
  
  private void logMouse() {
    if(prevMouseX != mouseX || prevMouseY != mouseY){
      print("mouse X position at: ");
      print(mouseX);
      print("\n mouse Y position at: ");
      print(mouseY);
      print("\n");
    }
    prevMouseX = mouseX;
    prevMouseY = mouseY;
}
}
