// This file has been developed ond the day of: 24/02/2025
// List grows dynamically
// Only one type of data

List<string> list = new List<string>() {"Marie","Marta","Mariane"};

//Operations are the same as ArrayList

//Methods
//Contains, Sort e Clear

//list.Find();
//list.FindLast();
//list.FindIndex();
//list.FindLastIndex();
//list.FindAll();

var name = list.Find(Search);
Console.WriteLine(name);

name = list.FindLast(Search);
Console.WriteLine(name);

var names = list.FindAll(Search);

foreach (var i in names)
{
    Console.WriteLine(i);
}

static bool Search(string item)
{
    return item.Contains('M');
}