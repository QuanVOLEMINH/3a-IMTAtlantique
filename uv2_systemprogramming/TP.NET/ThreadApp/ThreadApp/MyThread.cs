using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ThreadApp
{
    class MyThread
    {
        public string Type { get; set; }

        public int Id { get; set; }

        public MyThread(string type, int id)
        {
            Type = type;
            Id = id;
        }

        public override string ToString()
        {
            return "Le thread de type " + Type + " et son ID est: " + Id;
        }

        public static bool IsBallonThread(MyThread mt)
        {
            return mt.Type == "ballon";
        }

        public static bool IsPremierThread(MyThread mt)
        {
            return mt.Type == "premier";
        }
    }
}
