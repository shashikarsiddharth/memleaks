#include<iostream>
#include<unistd.h>

using namespace std;
unsigned int microseconds;

void leak_mem(){
    char *ptr = new char(5);
    return;
}

int main(){
    int i = 0;
    while(true){
        cout << "Simulating memory leak in c++.\n";
        leak_mem();
        usleep(10);
        i++;
    }
    return 0;
}
