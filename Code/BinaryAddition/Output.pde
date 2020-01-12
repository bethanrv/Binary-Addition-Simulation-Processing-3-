class Output {
  int x, y;
  boolean isActive;
  int base;

  Output(int x, int y, boolean isActive, int base) {
    this.x = x;
    this.y = y;
    this.isActive = isActive;
    this.base = base;
  }

  void toggleIsActive() {
    if (isActive) {
      isActive = false;
    } else {
      isActive = true;
    }
  }
}
