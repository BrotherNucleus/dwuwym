 
public class PObjectK extends Object {
  
    private boolean moveRight = false;
  private boolean moveLeft = false;
  private boolean movedLeft = false;
  private boolean movedRight = false;
  private boolean moveDown = false;
  private boolean moveUp = false;
  private float smooth = 0.2;
  
    public PObjectK(PVector pos, boolean isMoving, String path, PVector s) {
      super(pos, isMoving, path, s);
    }
    
      public void display() {
    if(moves) {
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
  
  public void pressKey(char sign) {
    switch (sign) {
      case 'D': {
        moveRight = true;
        break;
      }
      case 'A' : {
        moveLeft = true;
        break;
      }
      case 'S' : {
        moveDown = true;
       break;  
     }
      case 'W' : {
        moveUp = true;
       break;  
     }
    }
  }
  
    public void releaseKey(char sign) {
    switch (sign) {
      case 'D': {
        moveRight = false;
        break;
      }
      case 'A' : {
        moveLeft = false;
        break;
      }
      case 'S' : {
        moveDown = false;
       break;  
     }
      case 'W' : {
        moveUp = false;
       break;  
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
      if(abs(speed - prevSpeed) < 0.11) {
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
      if(abs(speed - prevSpeed) < 0.11) {
        speed = 0;
        movedLeft = false;
      }
      
    }
    position.x += speed;
  }
  
      private void controller() {
    if((speed > 0 && stopRight) || (speed < 0 && stopLeft)) {
      speed = 0;
    } else {
      if(moveLeft) {
        speed = -1*targetSpeed*(1-smooth) + speed*smooth;
      }
      else if(moveRight) {
        speed = targetSpeed*(1-smooth) + speed*smooth;
      } else {
        speed -= speed*smooth;
        if(abs(speed) < 0.11) {
          speed = 0;
        }
      }
    }
    
    if((speedY > 0 && stopDown) || (speedY < 0 && stopUp)) {
      speedY = 0;
    } else {
      if(moveDown) {
        speedY = targetSpeed*(1-smooth) + speedY*smooth;
      } else if(moveUp) {
        speedY = -1*targetSpeed*(1-smooth) + speedY*smooth;
      }
      else {
        speedY -= speedY*smooth;
          if(abs(speedY) < 0.11) {
            speedY = 0;
          }
        }
    }
        position.x += speed;
        position.y += speedY;  
  }
}
