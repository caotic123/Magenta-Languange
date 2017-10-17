#include <iostream>
#include <string>
#include <stdio.h>
#include "magenta_.h"

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

using namespace std;

int main(int argc, char** argv)
{
    char x_[80];
    std::string cod;
    magenta* magenta_l = new magenta();

    printf("Magenta Languange Compiler\nWrite file to compiler\n");
    scanf("%79s", x_);
    magenta_l->load__file(x_);

    system("pause");

    return 0;
}
