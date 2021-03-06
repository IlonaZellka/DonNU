﻿using System;
using System.Collections.Generic;

namespace _9_1_2
{
    class Program
    {
        public enum Type { З, Б }
        public struct Village
        {
            public string Name;
            public Type Type;
            public double Area;
            public double Harvest;
        }
        public const int ViewTable = 1;
        public const int AddNote = 2;
        public const int DeleteNote = 3;
        public const int UpdateNote = 4;
        public const int SearchNote = 5;
        public const int ViewLog = 6;
        public const int Exit = 7;
        public struct Logo
        {
            public DateTime time;
            public string line;
        }
        static void Main(string[] args)
        {
            List<Village> dataTable = new List<Village>();
            List<Logo> log = new List<Logo>();
            dataTable.Add(new Village() { Name = "Соя", Type = Type.Б, Area = 13000, Harvest = 45 });
            dataTable.Add(new Village() { Name = "Чумиза", Type = Type.З, Area = 8000, Harvest = 17 });
            dataTable.Add(new Village() { Name = "Рис", Type = Type.З, Area = 25650, Harvest = 24 });
            int choice = 0;
            while (choice != 7)
            {
                PrintMenu();
                DateTime now;
                string input = Console.ReadLine();
                choice = int.Parse(input);
                switch (choice)
                {
                    case ViewTable:
                        Console.Clear();
                        ViewTbl(dataTable);
                        Log(log, choice);
                        break;

                    case AddNote:
                        Console.Clear();
                        Add(dataTable);
                        Log(log, choice);
                        break;

                    case DeleteNote:
                        Console.Clear();
                        now = DateTime.Now;
                        Delete(dataTable);
                        Log(log, choice);
                        break;

                    case UpdateNote:
                        Console.Clear();
                        now = DateTime.Now;
                        Update(dataTable);
                        Log(log, choice);
                        break;

                    case SearchNote:
                        Console.Clear();
                        Search(dataTable);
                        Log(log, choice);
                        break;

                    case ViewLog:
                        Console.Clear();
                        Log(log, choice);
                        ViewLg(log);
                        break;

                    case Exit:
                        break;

                    default:
                        Console.WriteLine("Ошибка. Вы ввели неправильное значение. Рекомендуем ввести число от 1 до 7.");
                        break;
                }
            }

        }
        
        public static void ViewTbl(List<Village> dataTable)
        {
            Console.WriteLine("*************************************************************************");
            Console.WriteLine("{0,15} {1,10} {2,20} {3,15} {4,8} ", "Наименование", "Тип", "Площадь (га)", "Урожайность", "*");
            Console.WriteLine("*************************************************************************");
            foreach (Village table in dataTable)
            {
                Console.WriteLine("{0,15} {1,10} {2,20} {3,15} {4,8}", table.Name, table.Type, table.Area, table.Harvest, "*");
            }
            Console.WriteLine("*************************************************************************");
            Console.WriteLine("{0,15} {1,29}", "Перечисляемый тип: З - зерновые, Б-бобовые", "*");
            Console.WriteLine("*************************************************************************");
        }
        public static void Add(List<Village> dataTable)
        {
            Console.WriteLine("Введите наименование сельскохозяйственной культуры");
            string name = Console.ReadLine();
            Console.WriteLine("Введите тип сельскохозяйственной культуры. З - зерновые, Б-бобовые");
            Type t = (Type)Enum.Parse(typeof(Type), Console.ReadLine());
            Console.WriteLine("Введите величину посевной площади в га");
            double area = double.Parse(Console.ReadLine());
            Console.WriteLine("Введите размер урожая");
            double hurvest = double.Parse(Console.ReadLine());
            dataTable.Add(new Village() { Name = name, Type = t, Area = area, Harvest = hurvest });
            Console.WriteLine("Запись добавлена");
        }
        public static void Delete(List<Village> dataTable)
        {
            Console.WriteLine("Введите номер строки, которую хотите удалить. Нумерация строк начинается с 0");
            int delNum = int.Parse(Console.ReadLine());
            dataTable.Remove(dataTable[delNum]);
            Console.WriteLine("Запись удалена");
        }
        public static void Update(List<Village> dataTable)
        {
            Console.WriteLine("Введите номер строки, которую хотите изменить. Нумерация строк начинается с 0");
            int upNum = int.Parse(Console.ReadLine());
            Console.WriteLine("Введите наименование сельскохозяйственной культуры");
            string name = Console.ReadLine();
            Console.WriteLine("Введите тип сельскохозяйственной культуры. З - зерновые, Б-бобовые");
            Type t = (Type)Enum.Parse(typeof(Type), Console.ReadLine());
            Console.WriteLine("Введите величину посевной площади в га");
            double area = double.Parse(Console.ReadLine());
            Console.WriteLine("Введите размер урожая");
            double hurvest = double.Parse(Console.ReadLine());
            dataTable[upNum] =  new Village() { Name = name, Type = t, Area = area, Harvest = hurvest };
            Console.WriteLine("Запись обновлена");
        }
        public static void Search(List<Village> dataTable) 
        {
            Console.WriteLine("Введите тип сельскохозяйственной культуры. З - зерновые, Б-бобовые");
            string srchTxt = Console.ReadLine();
            Type tp = (Type)Enum.Parse(typeof(Type), srchTxt);
            Console.WriteLine("*************************************************************************");
            Console.WriteLine("{0,15} {1,10} {2,20} {3,15} {4,8} ", "Наименование", "Тип", "Площадь (га)", "Урожайность", "*");
            Console.WriteLine("*************************************************************************");
            foreach (Village table in dataTable)
            {
                if(table.Type == tp)
                    Console.WriteLine("{0,15} {1,10} {2,20} {3,15} {4,8}", table.Name, table.Type, table.Area, table.Harvest, "*");
            }
            Console.WriteLine("*************************************************************************");
            Console.WriteLine("{0,15} {1,29}", "Перечисляемый тип: З - зерновые, Б-бобовые", "*");
            Console.WriteLine("*************************************************************************");
        }
        public static void Log(List<Logo> log, int choice)
        {
            DateTime now = DateTime.Now;
            switch (choice)
            {
                case 1:
                    log.Add(new Logo() { time = now, line = "Просмотр таблицы завершён" });
                    break;
                case 2:
                    log.Add(new Logo() { time = now, line = "Запись добавлена" });
                    break;
                case 3:
                    log.Add(new Logo() { time = now, line = "Запись удалена" });
                    break;
                case 4:
                    log.Add(new Logo() { time = now, line = "Запись обновлена" });
                    break;
                case 5:
                    log.Add(new Logo() { time = now, line = "Запись найдена" });
                    break;
                case 6:
                    log.Add(new Logo() { time = now, line = "Лог просмотрен" });
                    break;
                default:
                    break;
            }
        }
        public static void ViewLg(List<Logo> log)
        {
            TimeSpan result;
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            Console.WriteLine("{0,30}", "Просмотр лога");
            foreach (Logo lg in log)
            {
                Console.WriteLine("{0,10} {2,2} {1,8}", lg.time, lg.line, " - ");
            }
            Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            try
            {
                result = log[1].time.Subtract(log[0].time);
                for (int i = 1; i < log.Count; i++)
                {
                    if (log[i].time.Subtract(log[i - 1].time) > result)
                        result = log[i].time.Subtract(log[i - 1].time);
                }
                Console.WriteLine("{0:D2}:{1:D2}:{2:D2}", result.Hours, result.Minutes, result.Seconds + " - Самый долгий период бездействия пользователя");
                Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            }
            catch
            {
                Console.WriteLine("Недостаточно действий");
            }
        }

        public static void PrintMenu()
        {
            Console.WriteLine("-------------------------");
            Console.WriteLine("{0,18} {1,7}", "Выберите пункт", "|");
            Console.WriteLine("{0,-10} {1,5}", "1 - Просмотр таблицы", "|");
            Console.WriteLine("{0,-10} {1,6}", "2 - Добавить запись", "|");
            Console.WriteLine("{0,-10} {1,7}", "3 - Удалить запись", "|");
            Console.WriteLine("{0,-10} {1,6}", "4 - Oбновить запись", "|");
            Console.WriteLine("{0,-10} {1,8}", "5 - Поиск записей", "|");
            Console.WriteLine("{0,-10} {1,6}", "6 - Просмотреть лог", "|");
            Console.WriteLine("{0,-10} {1,15}", "7 - Выход", "|");
            Console.WriteLine("-------------------------");
        }

    }
    
}
