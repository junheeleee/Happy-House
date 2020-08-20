package com.ssafy.happyhouse.util;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.ssafy.happyhouse.model.HouseDeal;

public class QuickSort {
	public static List<HouseDeal> quickSort(List<HouseDeal> list) {
		
		if (list.size() <= 1)
			return list;
		int pivot = Integer.parseInt(list.get(list.size() / 2).getDealAmount().replace(",", "").trim());

		List<HouseDeal> lesserArr = new LinkedList<>();
		List<HouseDeal> equalArr = new LinkedList<>();
		List<HouseDeal> greaterArr = new LinkedList<>();

		for (HouseDeal houseDeal : list) {
			if (Integer.parseInt(houseDeal.getDealAmount().replace(",", "").trim()) < pivot)
				lesserArr.add(houseDeal);
			else if (Integer.parseInt(houseDeal.getDealAmount().replace(",", "").trim()) > pivot)
				greaterArr.add(houseDeal);
			else
				equalArr.add(houseDeal);
		}

		
		return Stream.of(quickSort(lesserArr), equalArr, quickSort(greaterArr)).flatMap(Collection::stream)
				.collect(Collectors.toList());
	}
}
