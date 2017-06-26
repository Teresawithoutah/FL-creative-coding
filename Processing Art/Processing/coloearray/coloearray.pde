float[] grayValueForArray;
int num;


void setup() {
 size(400, 300);
 num = 3;
 //Initiate Array
 grayValueForArray = new float[num];
 //Input value into Array
 for (int i=0; i<num; i++) {
 grayValueForArray[i] = 80*i;
 }

}
void draw() {
 background(255);

 //Use values from array
 for (int i=0; i<num; i++) {
 fill( grayValueForArray[i] );
 ellipse(100+100*i, 100, 40, 40);
 }


}