//stores list of points, activation status, and index of conencted input/gate
class Connection {

  ArrayList <Point> points;
  boolean isActivated;
  boolean isPlaced;
  boolean isOnInput;
  int index;

  Connection(int x, int y, boolean isOnInput, int input) {
    points = new ArrayList<Point>();
    isActivated = false;
    isPlaced = false;
    addPoint(x, y);
    this.isOnInput = isOnInput;
    this.index = input;
  }

  void activated() {
    isActivated = true;
  }

  void addPoint(int x, int y) {
    points.add(new Point(x, y));
  }

  boolean isActivated() {
    //for connections on input...
    if (isOnInput) {
      if (inputs.get(index).isActive) {
        isActivated = true;
        return true;
      }
    } else {
      if (gates.size() > index && gates.get(index).isActivated()) {
        isActivated = true;
        return true;
      } else {
        return false;
      }
    }

    return false;
  }
}
