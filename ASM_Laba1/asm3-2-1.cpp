#include <stdio.h>
#include <conio.h>
#include <iostream>

using namespace std;

const double n1 = 73;
const double n2 = 66;
const double n3 = 83;
const char ch = 'A';

void access7(double num1, double num2, double num3, char char1) {
	if (num1 == n1)
	{
		if (num2 == n2) {
			if (char1 == ch) {
				if (num3 == n3) {
					cout << "Accsess granted" << endl;
				}
			}
		}
	}
	else cout << "Access denied" << endl;
}

int main() {
	double num1, num2, num3;
	char char1;

	cin >> num1;
	cin >> num2;
	cin >> num3;
	cin >> char1;
	access7(num1, num2, num3, char1);

}