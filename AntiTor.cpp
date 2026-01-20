#include <iostream>
int main() {
_wchdir(L"./tor");
std::system("start /min tor.exe -f ../torrc.txt");
}
