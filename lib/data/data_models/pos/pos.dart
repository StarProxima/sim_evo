class Pos {
  final int x;
  final int y;

  Pos(this.x, this.y);

  Pos operator +(Pos other) {
    return Pos(x + other.x, y + other.y);
  }
}
