// This file has been developed ond the day of: 24/02/2025
// Array List is a Class
// Type Object
// It can store multiple types of data

using System.Collections;

ArrayList list = new ArrayList(5) { "Marie", 25, 2.5, true };
int[] numbers = { 1, 2, 3 };
string[] fruits = { "Apple", "Orange" };

//Operations
list.Add("Anne");
list.Insert(1, 10);
list.AddRange(numbers);
list.InsertRange(3, fruits);
list.RemoveAt(1);
list.Remove("Anne");
list.RemoveRange(0, 1);

foreach (var item in list)
{
    Console.WriteLine(item);
}

//Methods
list.Contains("1"); //return true or false
//list.Sort(); //Sorts needs to be an array list with only one type of data
list.Clear();


