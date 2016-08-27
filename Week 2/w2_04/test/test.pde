import controlP5.*;

ControlP5 cp5;

String[] textfieldNames = {"What's your favorite color", "What's your favorite shape",
"Who is your favorite TV Character"};

void setup() {
  size(700,400);

  PFont font = createFont("comic-sans",19);

  cp5 = new ControlP5(this);

  int y = 20;
  int spacing = 80;
  for(String name: textfieldNames){
    cp5.addTextfield(name)
       .setPosition(20,y)
       .setSize(100,40)
       .setFont(font)
       .setFocus(true)
       .setColor(color(0,255,0))
       ;
     y += spacing;
  }

  textFont(font);
}

void draw() {
  background(78);
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("This box '"
            +theEvent.getName()+"' has this text: '"
            +theEvent.getStringValue()+"'"
            );
            
  }
}