#include<iostream>
using namespace std;

void leak_mem(){
    int *ptr = new int(5);
    return;
}

int main(){
    while(true){
        cout << "Simulating memory leak in c++.\n";
        leak_mem();
    }
    return 0;
}
