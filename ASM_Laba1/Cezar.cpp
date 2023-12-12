//#include <stdio.h>
//#include <conio.h>
//#include <iostream>
//
//using namespace std;
//
//int main()
//{
//	char str[255] = "";
//	char alphabet[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '\0'};
//	int luft;
//	
//	cout << "Input str" << endl;
//	cin >> str;
//	cout << "Input luft" << endl;
//	cin >> luft;
//	int len = strlen(str);
//	int alen = strlen(alphabet);
//	int i = 0;
//	for (int i = 0; i < len; i++)
//	{
//		for (int j = 0; j < alen; j++)
//		{
//				if (str[i] == alphabet[j])
//				{
//					if (j + luft >= alen)
//						str[i] = alphabet[j + luft - alen];
//					else
//						str[i] = alphabet[j + luft];
//					break;
//				}
//		}
//	}
//
//	cout << "str" << endl;
//	cout << str << endl;
//	cout << "str" << endl;
//}