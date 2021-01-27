#pragma once
#include <string>
#include <vector>
#include <iostream>

using namespace std;

template <typename T>
class Cache
{
private:
	vector<T> data;

public:
	void put(T elem) { data.push_back(elem); }

	void operator+=(T elem) { data.push_back(elem); }

	string contains(T elem) {

		for (int i = 0; i < data.size(); i++) {
			if (data[i] == elem) return "���������� � Cache";
		}
		return  "�� ���������� � Cache";
	}
};

//---------------------
template <>
class Cache<string> 
{
private:
	vector<string> dataStr;

public:
	void put(string elem) { dataStr.push_back(elem); }

	string contains(string elem) {

		for (int i = 0; i < dataStr.size(); i++) {
			if (dataStr[i][0] == elem[0]) return "���������� � Cache";
		}
		return  "�� ���������� � Cache";
	}

	void add() { if (dataStr.size() > 100)  throw -1; }
};
