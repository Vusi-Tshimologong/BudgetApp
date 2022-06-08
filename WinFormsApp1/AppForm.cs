using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SqlDataAccess;
namespace WinFormsApp1
{
    public partial class AppForm : Form
    {
        public sqlAccess Data { get; set; }
        public string cs { get; set; } = "";
        public DateTime month { get; set; }

        public AppForm()
        {
            InitializeComponent();
            Data = new sqlAccess(cs);

        }

        private void AppForm_Load(object sender, EventArgs e)
        {

   
        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {
          
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
                if (comboBox1.Text =="INCOME")
                {
                    Data.commandor(textBox2.Text,double.Parse(textBox1.Text),true,DateTime.Now);
                }
                else
                {
                    Data.commandor(textBox2.Text,double.Parse(textBox1.Text), false, DateTime.Now);
                }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Data.ReadBudget(DateTime.Now);
            comboBox1.Text= Data.income;
            comboBox1.Text=Data.expense;
        }
    }
}
