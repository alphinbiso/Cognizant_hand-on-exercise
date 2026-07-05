package com.example.search;

public class Main {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Phone", "Electronics"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Headphones", "Electronics")

        };

        System.out.println("---- LINEAR SEARCH ----");

        Product result1 = SearchAlgorithms.linearSearch(products, 103);

        if (result1 != null)
            System.out.println(result1);
        else
            System.out.println("Product not found.");

        System.out.println();

        System.out.println("---- BINARY SEARCH ----");

        Product result2 = SearchAlgorithms.binarySearch(products, 103);

        if (result2 != null)
            System.out.println(result2);
        else
            System.out.println("Product not found.");

        System.out.println();

        System.out.println("Time Complexity");
        System.out.println("-------------------------");
        System.out.println("Linear Search : O(n)");
        System.out.println("Binary Search : O(log n)");
    }
}