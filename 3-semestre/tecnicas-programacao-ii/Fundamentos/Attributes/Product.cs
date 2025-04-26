namespace Attributes
{
    internal class Product
    {
        public Product(string name)
        {
            this.Name = name;
        }

        public Product(string name, double price, int minStock) : this(name) //ctor
        {
            //this.Name = name;
            //Price = price;
            //MinStock = minStock;
            //FinalPrice = Price - (Price * Discount);
        }

        //public string? Name { get; set; } //prop
        private string? name;
        public string? Name
        {
            get { return name; }
            set { name = value; }
        }

        private double price;
        public double Price
        {
            get { return price; }
            set
            {
                if (Price < 5)
                {
                    price = 5;
                }
                else
                {
                    price = value;
                }
            }
        }

        private double discount = 0.05;
        public double Discount
        {
            get { return discount; }
        }

        private int minStock;
        public int MinStock
        {
            set { minStock = value; }
        }
        public double FinalPrice
        {
            get { return Price - (price * discount) ; }
        }
        public static string? Description { get; set; } // Attributes and Methods STATIC don't need to be instanciated to be used

        //public void Display()
        //{
        //    Console.WriteLine($"Name: {Name}");
        //    Console.WriteLine($"Price: {Price.ToString("c")}");
        //    Console.WriteLine($"Discont: {Discount.ToString("F2")}");
        //    Console.WriteLine($"Minimun Stock: {MinStock}");
        //    Console.WriteLine($"Final Price: {FinalPrice.ToString("c")}");
        //}

        public static void Display(Product product)
        {
            Console.WriteLine($"Name: {product.Name}");
            Console.WriteLine($"Price: {product.Price.ToString("c")}");
            Console.WriteLine($"Discount: {product.Discount.ToString("F2")}");
            Console.WriteLine($"Minimun Stock: {product.minStock}");
            Console.WriteLine($"Final Price: {product.FinalPrice.ToString("c")}");
            Console.WriteLine($"Description: {Description}");
        }
    }
}
