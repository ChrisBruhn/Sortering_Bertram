
/*Chat GPT*/
String strToSort = lavesaetning();

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
  strToSort = radixSort(strToSort);
  // Stop tiden
  long sluttTid = millis();

  // Beregn og skriv ut tiden i millisekunder
  long totalTid = sluttTid - startTid;
  println("Tid brugt: " + totalTid + " millisekunder");

  text(strToSort, 100, 100);
}

char lavebogstav() {
  return (char) random(65, 91);
}

String lavesaetning() {
  int i = 0;
  String str = "";
  while (i < 1500) {
    str = str + lavebogstav();
    i++;
  }
  return str;
}

String radixSort(String s) {
  int n = s.length();
  int maxChar = 256; // Assuming ASCII characters

  // Initialize buckets
  ArrayList<String>[] buckets = new ArrayList[maxChar];
  for (int i = 0; i < maxChar; i++) {
    buckets[i] = new ArrayList<String>();
  }

  // Perform counting sort for each character position
  for (int pos = n - 1; pos >= 0; pos--) {
    for (int i = 0; i < n; i++) {
      int charIndex = (int) s.charAt(i);
      buckets[charIndex].add(s.substring(i, i + 1));
    }

    // Reconstruct the string based on the buckets
    StringBuilder sortedString = new StringBuilder();
    for (int i = 0; i < maxChar; i++) {
      for (String str : buckets[i]) {
        sortedString.append(str);
      }
      buckets[i].clear();
    }

    // Update the original string
    s = sortedString.toString();
  }

  return s;
}
