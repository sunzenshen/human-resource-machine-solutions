int Exclusive_Lounge(int x, int y) {
  if (y >= 0)
  {
    if (x >= 0) return 0;
    else return 1;
  }
  else // y < 0
  {
    if (x >= 0) return 1;
    else return 0;
  }
}

