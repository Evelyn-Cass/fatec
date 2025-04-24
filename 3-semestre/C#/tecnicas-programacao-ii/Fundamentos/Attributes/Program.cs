// This file has been developed ond the day of: 17/02/2025

using Attributes;

//Product product = new Product("Journal",25.00,0.1,30);
Product product = new Product(price: 3.00, minStock: 30, name: "Journal");

Product.Description = "This is a product";

//product.name = "Journal";
//product.price = 25.00;
//product.discont = 0.10;
//product.minStock = 30;
//product.finalPrice = product.price - (product.price * product.discont);

//product.Display();
Product.Display(product); // Static Method

Console.ReadLine();
