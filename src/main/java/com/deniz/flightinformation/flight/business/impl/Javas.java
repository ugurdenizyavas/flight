package com.deniz.flightinformation.flight.business.impl;

import java.util.ArrayList;
import java.util.List;

public class Javas {

	public static void main(String[] args) {

		List<Integer> intList = new ArrayList<Integer>();
		intList.add(8);
		intList.add(5);
		intList.add(1);
		intList.add(4);
		intList.add(9);
		intList.add(54);

		for (int i = 0; (i < intList.size()); i++) {
			if (intList.get(i) > 5) {
				System.out.print(i + " ninci eleman ");
				System.out.println(intList.get(i));
			}
		}
	}
}
