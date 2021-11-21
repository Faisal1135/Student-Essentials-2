// calculate the Grade from given CGPA

String calculateGradeFromCGPA(double cgpa) {
  if (cgpa >= 4.0) {
    return "A+";
  } else if (cgpa >= 3.75) {
    return "A";
  } else if (cgpa >= 3.50) {
    return "A-";
  } else if (cgpa >= 3.25) {
    return "B+";
  } else if (cgpa >= 3.00) {
    return "B";
  } else if (cgpa >= 2.75) {
    return "B-";
  } else if (cgpa >= 2.50) {
    return "C";
  } else if (cgpa >= 2.25) {
    return "D";
  } else {
    return "F";
  }
}
