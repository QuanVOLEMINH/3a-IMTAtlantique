using System;
using System.Threading;

namespace ClassLibrary1
{
    public class ConsolePremier
    {

        private static int commonIndex = 0;
        private int index;

        public ConsolePremier()
        {
            index = commonIndex++;
        }
        public void NombresPremiers()
        {

            for (int p = 1; p < 1000000; p++)
            {
                int i = 2;
                while ((p % i) != 0 && Math.Sqrt(i) < p)
                {
                    i++;
                }
                if (i == p)
                    Console.WriteLine("Premier(" + index + ") = " + p.ToString());
                Thread.Sleep(100);
            }
        }


        static public void ConsoleConfig()
        {
            Console.BackgroundColor = ConsoleColor.Blue;
            Console.Clear();
            Console.ForegroundColor = ConsoleColor.Green;

            Console.SetBufferSize(132, 600);
            Console.SetWindowSize(16, 32);
        }

    }
}
