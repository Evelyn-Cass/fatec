// This file has been developed ond the day of: 24/02/2025

//string[] names = new string[4];
//names = [ "Anna", "Kevin", "Mary", "Samuel" ];
string[] names = { "Anna", "Samuel", "Mary", "Kevin" };
DisplayNames(names);

Console.WriteLine("---REVERSE---");
Array.Reverse(names);
DisplayNames(names);

Console.WriteLine("---SORT---");
Array.Sort(names);
DisplayNames(names);

Console.WriteLine("---BINARY SEARCH---");
var index = Array.BinarySearch(names, "Anna");
Console.WriteLine($"names[{index}] = \"Anna\"");

void DisplayNames(string[] names)
{
    foreach (var name in names)
    {
        Console.WriteLine(name);
    }
}

Console.ReadLine();

