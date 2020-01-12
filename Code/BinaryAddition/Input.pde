class Input {
  int x, y;
  boolean isActive;

  Input(int x, int y, boolean isActive) {
    this.x = x;
    this.y = y;
    this.isActive = isActive;
  }

  void toggleIsActive() {
    if (isActive) {
      isActive = false;
    } else {
      isActive = true;
    }
  }
}
