using System;

namespace Practice
{
    class Program
    {
        static int factorial(int n)
        {
            if (n < 0)
            {
                return -1;
            }
            if (n == 0 || n == 1)
            {
                return 1;
            }

            return n * factorial(n - 1);
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Your Number: ");
            int x = Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Hello World!");
            Console.WriteLine(factorial(x));

        }
    }
}
