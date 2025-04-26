//IEnumerable - Generic collection of elements that allows iteration over the collection
//Icollection - Generic collection of elements that can be modified, added, removed, or counted
// This file has been developed ond the day of: 10/03/2025

//IEnumerable
ExempleIEnumerables obj = new ExempleIEnumerables();
List<string> names1 = new List<string> { "John", "Doe", "Jane" };
String[] names2 = ["Henry", "Lanna", "Rony"];

obj.ShowNames(names1);
obj.ShowNames(names2);

//Collections


ICollection<string> animals = new List<string> { "Cat", "Dog" };
animals.Add("Bird");

obj.ShowNames(animals);

animals.Remove("Dog");

foreach (var item in animals)
{
      Console.WriteLine(item);
}

public class ExempleIEnumerables
{
    public void ShowNames(IEnumerable<string> names)
    {
        foreach (var name in names)
        {
            Console.WriteLine(name);
        }
    }
}


