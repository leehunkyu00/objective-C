#include <stdio.h>

int multiplier = 8;
int (^myBlock)(int) = ^(int num) {
    return num * multiplier;
};

int main(void) {

    printf("%d\n", myBlock(10));
    return 0;
}
