using System;
using SqlDataAccess;
namespace BudgetApp.Console
{
    internal class Program
    {

        static void Main(string[] args)
        {
            
            System.Console.WriteLine("Insert items for your budget Below \n");
            var exit = "C";

            string cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BudgetData;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            var budget = new sqlAccess(cs);

            while (exit != "E")
            {

                System.Console.WriteLine("Enter Item type  1:Income  or 0: Expenditure");
                var isIncome = Convert.ToInt32(System.Console.ReadLine());


                //var manager = new Program();

                switch (isIncome)
                {
                    case 1:
                        var itemType = true;
                        System.Console.WriteLine("Please Enter item Description: ");
                        var itemDesc = System.Console.ReadLine();

                        System.Console.WriteLine("Please enter amount: ");
                        var itemAmount = Convert.ToDouble(System.Console.ReadLine());


                        System.Console.WriteLine("Enter C: Continue or E:Exit");
                        exit =System.Console.ReadLine();
                        budget.commandor(itemDesc, itemAmount,itemType,DateTime.Now);
                        break;
                    case 0:
                        itemType = false;
                        System.Console.WriteLine("Please Enter item Description: ");
                        itemDesc = System.Console.ReadLine();

                        System.Console.WriteLine("Please enter amount: ");
                        itemAmount = Convert.ToDouble(System.Console.ReadLine());

                        System.Console.WriteLine("Enter C: Continue or E:Exit");
                        exit = System.Console.ReadLine();
                        budget.commandor(itemDesc, itemAmount, itemType,DateTime.Now);
                        break;
                    default:
                        System.Console.WriteLine("Invalid input, Please try again:\n");
                        exit = "C";
                        System.Console.Clear();
                        break;
                }

            }
            
            budget.ReadBudget(DateTime.Now);
            
            var income = budget.income;
            var expense = budget.expense;
            var diff = budget.diff;
            //System.Console.WriteLine(display);

            System.Console.WriteLine(String.Format("This is the Total Income {0} and Total Expense {1} and Diff is {2}", income, expense,diff));
            //budget.ReadBudget();

            //var budgetreport = budget.Report.ToString();

            //System.Console.WriteLine (budgetreport);

        }

        //static string myMethod(bool itemType, sqlAccess budget)
        //{
        //    System.Console.WriteLine("Please Enter item Description: ");
        //    var itemDesc = System.Console.ReadLine();

        //    System.Console.WriteLine("Please enter amount: ");
        //    var itemAmount = Convert.ToDouble(System.Console.ReadLine());

            
        //    System.Console.WriteLine("Enter C: Continue or E:Exit");

        //    return System.Console.ReadLine();
        //}
    }
}
