using System;
using System.Collections.Generic;

namespace Lab_1
{
    internal class Program
    {
        public static string Singleton(string element)
        {
            List<string> people = new List<string>();
            people.Add(element);
            return String.Join("", people);
        }

        public static Boolean Null(List<string> check)
        {
            Boolean el;
            if (check.Count == 0)
            {
                el = false;
            }
            else
            {
                el = true;
            }
            return el;
        }

        public static string Snoc (List<string> check, string element)
        {
            check.Add(element);
            return String.Join("\t", check);
        }

        public static int Length(List<string> all_count)
        {
            int count = 0;
            foreach (string item in all_count)
            {
                count++;
            }
            return count;
        }

        static void Main(string[] args)
        {
            string element = "First element";
            string mes = Singleton(element);
            Console.WriteLine(mes);

            List<string> num = new List<string>();
            num.Add("ss");
            Boolean al = Null(num);
            Console.WriteLine(al);

            List<string> checklist = new List<string>() { "Tom", "Bob", "Sam" };
            string add_el = "todo";
            string all = Snoc(checklist, add_el);
            Console.WriteLine(all);

            int result = Length(checklist);
            Console.WriteLine(result);
        }
    }
}
