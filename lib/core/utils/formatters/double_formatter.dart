String doubleFormatter(double dnum) {
  if (dnum % 1 == 0) {
    return dnum.toInt().toString();
  }
  return dnum.toStringAsFixed(2);
}
