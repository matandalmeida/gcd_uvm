#include <stdio.h>
#include <math.h>
extern "C" int my_mdc(int x, int y){
    int resto;
    resto = x % y;
    while(resto != 0) {
        x = y;
        y = resto;
        resto = x % y;
    };
    return y;
}
