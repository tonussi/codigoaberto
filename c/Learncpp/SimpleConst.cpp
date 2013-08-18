/*
 * SimpleConst.cpp
 *
 *  Created on: Aug 12, 2013
 *      Author: tonussi
 */

#include <iostream>
using std::cout;
using std::endl;


void f(const int[]);

int main() {
	int * a;
	a[0] = 10;
	f(&a[0]);
	cout << "f(a) imprime de uma cópia inteira do array {10,20,30}\n"
			"a primeira posicao disponivel e logo apos eu imprimo"
			"a[0] depois ' ' etc..";
	cout << ' ' << a[0] << ' ' << a[0] << ' ' << a[0] << '\n';
	return 0;
}

void f(const int * b) {
	cout << b[0];
}

