 //<>//
String strToSort=lavesaetning();
boolean done = true;

void setup() {
  size(50, 50);
  textSize(14);
  noLoop();
  fill(0);
}


void draw() {
  background(227);

  // Start tiden
  long startTid = millis();
  println( sortMyStr(strToSort));
  // Stop tiden
  long sluttTid = millis();

  // Beregn og skriv ut tiden i millisekunder
  long totalTid = sluttTid - startTid;
  println("Tid brugt: " + totalTid + " millisekunder");


  // Start tiden
   startTid = millis();

  println(binarySort(strToSort));

// Stop tiden
   sluttTid = millis();

  // Beregn og skriv ut tiden i millisekunder
   totalTid = sluttTid - startTid;
  println("Tid brugt: " + totalTid + " millisekunder");


}
char lavebogstav() {
  return (char) random(65, 91);
}
String lavesaetning() {
  int i = 0;
  String str ="";
  while (i < 1500) {
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


String binarySort(String input) {
  char[] charArray = input.toCharArray();

  for (int i = 1; i < charArray.length; i++) {
    char currentChar = charArray[i];
    int j = i - 1;

    // Perform binary sort by comparing characters
    while (j >= 0 && charArray[j] > currentChar) {
      charArray[j + 1] = charArray[j];
      j--;
    }

    charArray[j + 1] = currentChar;
  }

  return new String(charArray);
}
