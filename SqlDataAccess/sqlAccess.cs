using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace SqlDataAccess
{

    public class sqlAccess
    {

        public string connectionString { get; }
        public string income { get; set; }
        public string expense { get; set; }
        public string diff { get; set; }


        public sqlAccess(string cs)
        {
            connectionString = cs;
        }


        public void commandor(string itemDescription, double itemValue, bool itemType, DateTime month)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = connectionString;

                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.Connection.Open();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "spInsertIntoBudget";

                    cmd.Parameters.AddWithValue("@Name", itemDescription);
                    cmd.Parameters.AddWithValue("@Amount", itemValue);
                    cmd.Parameters.AddWithValue("@type", itemType);
                    cmd.Parameters.AddWithValue("@month", month);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void ReadBudget(DateTime month)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = connectionString;
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "spGetBudgetReport";

                    cmd.Parameters.Add("@TotalExpenditure", SqlDbType.Decimal);
                    cmd.Parameters.Add("@TotalIncome", SqlDbType.Decimal);
                    cmd.Parameters.Add("@Difference", SqlDbType.Decimal);
                    cmd.Parameters.AddWithValue("@Month", month);

                    cmd.Parameters["@TotalExpenditure"].Direction = ParameterDirection.Output;
                    cmd.Parameters["@TotalIncome"].Direction = ParameterDirection.Output;
                    cmd.Parameters["@Difference"].Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();
                    //var results = new StringBuilder();

                    expense = cmd.Parameters["@TotalExpenditure"].Value.ToString() + ";";
                    income = cmd.Parameters["@TotalIncome"].Value.ToString() + ";";
                    diff = cmd.Parameters["@Difference"].Value.ToString();

                    //report=results.ToString();
                    //return report;  
                }
            }
        }
    }
}
