// This file has been developed ond the day of: 24/02/2025

//Lambida is a anonymus function that uses an arrow operator

var fruits = new List<string>() { "Apple", "Orange", "Grape" };

var result = fruits.Find(i => i.Contains('e'));
Console.WriteLine(result);

result = fruits.FindLast(i => i.Contains('e'));
Console.WriteLine(result);

var i = fruits.FindIndex(i => i.Contains("Apple"));
Console.WriteLine(i);