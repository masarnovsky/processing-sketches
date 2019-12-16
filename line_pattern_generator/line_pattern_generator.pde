     int hw = 666;


     void setup() {
       size(666, 666);
       background(0);
       stroke(255);
       for (int i = 0; i < 10; i++) {
         int a = (int) random((float)hw);
         int b = (int) random((float)hw);
         line(a, 0, a, hw);
         line(0, b, hw, b);
       }
     }
