 //<>//
String strToSort=lavesaetning();
boolean done = true;

void setup() {
  size(800, 800);
  textSize(14);
  noLoop();
  fill(0);
}


void draw() {
  background(227);
  text(strToSort, 100, 80);
// Start tiden
  long startTid = millis();
  strToSort = sortMyStr(strToSort);
// Stop tiden
  long sluttTid = millis();
  
  // Beregn og skriv ut tiden i millisekunder
  long totalTid = sluttTid - startTid;
  println("Tid brukt: " + totalTid + " millisekunder");
  
  
  text(strToSort, 100, 100);
}
char lavebogstav() {
  return (char) random(65, 91);
}
String lavesaetning() {
  int i = 0;
  String str ="";
  while (i < 150) {
    str = str + lavebogstav();
    i++;
  }
  return str;
}
String sortMyStr(String s) {
  String head, tail;
  head = "";
   tail = "";
  for (int i = 0; i<strToSort.length()-1; i++) {
    for (int j = 0; j<strToSort.length()-1; j++) {

      // vi glemte betingelsen for hvornår vi skal sortere!
      if (s.charAt(j)> s.charAt(j+1)) {
        char tmp1 = s.charAt(j);
        char tmp2 = s.charAt(j+1);
        head=s.substring(0, j);
        
        if (j<s.length()-1) {
          tail=s.substring(j+2, s.length());
        }
        s = head+tmp2+tmp1+tail;
        j=0;
      }
    }
  }
  return s;
}
