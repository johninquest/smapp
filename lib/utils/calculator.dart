class CalculatorService {
  calculateMean(List<double> grades) {
    if (grades.isNotEmpty) {
      final listSize = grades.length;
      final listSum = grades.reduce((a, b) => a + b);
      final listMean = listSum / listSize;
      return listMean;
    } else {
      return 0;
    }
  }
}
