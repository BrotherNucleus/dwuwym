public class tileObject extends Object {
  PVector bg;
  public tileObject(PVector pos, boolean isMoving, String path, PVector s, PVector bgC){
    super(pos, isMoving, path, s);
    bg = bgC;
  }
  
  public void display() {
       translate(position.x, position.y);
       beginShape();
         if(img != null) {
             texture(img);
         } else {
           fill(bg.x, bg.y, bg.z);
         }
         //second pair of numbers here must be the size of the texture
         vertex(0, 0, 0, 0);
         vertex(size.x, 0, 50, 0);
         vertex(size.x, size.y, 50, 50);
         vertex(0, size.y, 0, 50);
       endShape();
  }
}
