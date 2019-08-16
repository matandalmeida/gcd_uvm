#include <iostream>

using namespace std;

extern "C" int my_mdc(int x, int y){
  int gcd;
    if (x == 0) gcd = y;
    else if (y == 0) gcd = x;
    else {
      for (int i = 1; i <= x && i <= y; i++){
        if (((x % i) == 0) && ((y % i) == 0)) gcd = i;
      }
    }
  return gcd;
}
