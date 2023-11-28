
public class PObjectM extends Object {
  
    private boolean moveRight = false;
  private boolean moveLeft = false;
  private boolean moveUp = false;
  private boolean moveDown = false;
  private boolean movedLeft = false;
  private boolean movedRight = false;
  private float smooth = 0.2;
  private int prevMouseX = 0;
  private int prevMouseY = 0;
    public PObjectM(PVector pos, boolean isMoving, String path, PVector s, PVector cntr) {
      super(pos, isMoving, path, s);
      camCenter = cntr;
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
    float n = position.x - camCenter.x;
    float r = mouseX - width/2;
    float u = position.y - camCenter.y;
    float m = mouseY - height/2;
    if(n > 0) {
      if(r*skl > n + size.x) {
        moveRight = true;
        moveLeft = false;
      } else if (r*skl < n) {
        moveRight = false;
        moveLeft = true;
      } else {
        moveRight = false;
        moveLeft = false;
       }
       
      if (m*skl > u + size.y) {
        moveUp = true;
        moveDown = false;
      } else if (m*skl < u) {
        moveUp = false;
        moveDown = true;
      } else {
        moveUp = false;
        moveDown = false;
      }
       
    } else {
      if(r*skl < n) {
        moveRight = false;
        moveLeft = true;
      } else if (r*skl > n + size.x) {
        moveRight = true;
        moveLeft = false;
      } else {
        moveRight = false;
        moveLeft = false;
       }
       
      if (m*skl < u) {
        moveUp = false;
        moveDown = true;
      } else if (m*skl > u + size.y) {
        moveUp = true;
        moveDown = false;
      } else {
        moveUp = false;
        moveDown = false;
      }
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
    
    if(moveUp) {
      speedY = targetSpeed*(1-smooth) + speedY*smooth;
    }
    else if(moveDown) {
      speedY = -1*targetSpeed*(1-smooth) + speedY*smooth;
    } else {
      speedY -= speedY*smooth;
      if(abs(speedY) < 0.01) {
        speedY = 0;
      }
    }
    if(!stopX) {
    position.x += speed;
    }
    if(!stopY){
    position.y += speedY;
    }
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
