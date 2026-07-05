package com.example.search;

public class SearchAlgorithms {

    // Linear Search
    public static Product linearSearch(Product[] products, int id) {

        for (Product product : products) {

            if (product.getProductId() == id) {
                return product;
            }

        }

        return null;
    }

    // Binary Search
    public static Product binarySearch(Product[] products, int id) {

        int left = 0;
        int right = products.length - 1;

        while (left <= right) {

            int mid = (left + right) / 2;

            if (products[mid].getProductId() == id) {
                return products[mid];
            }

            if (products[mid].getProductId() < id) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }

        }

        return null;
    }
}