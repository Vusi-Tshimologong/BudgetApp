using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;


namespace BudgetApp
{

    public partial class Form2 : Form
    {
        public sqlAccess Data { get; set; }
        public string cs { get; set; }  
        public DateTime month { get; set; }

        private void EnableAll(bool state)
        {
            //btnEnter.Enabled = state;
            comboBox1.Enabled = state;
            txtAmount.Enabled = state;
            txtDesc.Enabled = state;
            btnJanuary.Enabled = state; 
            btnFebruary.Enabled = state;
            btnMarch.Enabled = state;
            btnApril.Enabled = state;
            btnMay.Enabled = state;
            btnJune.Enabled = state;
            btnJuly.Enabled = state;
            btnAugust.Enabled = state;
            btnSeptember.Enabled = state;
            btnOctober.Enabled = state;
            btnNovember.Enabled = state;
            btnDec.Enabled = state;
            btnReport.Enabled = state;
        }

        public Form2()
        {
            InitializeComponent();
            //cs = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BudgetData;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            EnableAll(false);
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
          
        }

        private void label3_Click(object sender, EventArgs e)
        {
            
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            Data.ReadBudget(month);
            lblReport.Text =String.Format("The total expense is{0} and Total income is {1}", Data.expense, Data.income);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cs = txtConnectString.Text;
            Data = new sqlAccess(cs);
            btnEnter.Enabled = false;
            EnableAll(true);
        }

        private void txtDescription_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            bool itemType = false;
            if (comboBox1.Text=="Income")
            {
                itemType = true;
                Data.commandor(txtDesc.Text, Convert.ToDouble(txtAmount.Text), itemType, DateTime.Now);
            }
        
            else
            {
                Data.commandor(txtDesc.Text, Convert.ToDouble(txtAmount.Text), itemType, DateTime.Now);
            }
            
            
        }


        private void SelectInput_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void btnDec_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 12, 31);
            btnEnter.Enabled=true;
        }

        private void button16_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 11, 30);
            btnEnter.Enabled = true;
        }

        private void button17_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 10, 30);
            btnEnter.Enabled = true;
        }

        private void button18_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 09, 30);
            btnEnter.Enabled = true;
        }

        private void button19_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 08, 30);
            btnEnter.Enabled = true;
        }

        private void button20_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 07, 30);
            btnEnter.Enabled = true;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 06, 30);
            btnEnter.Enabled = true;
        }

        private void button22_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 05, 30);
            btnEnter.Enabled = true;
        }

        private void button23_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 04, 30);
            btnEnter.Enabled = true;
        }

        private void button24_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 03, 30);
            btnEnter.Enabled = true;
        }

        private void button25_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 02, 28);
            btnEnter.Enabled = true;
        }

        private void button26_Click(object sender, EventArgs e)
        {
            month = new DateTime(DateTime.Now.Year, 01, 30);
            btnEnter.Enabled = true;
        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void txtAmount_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            btnEnter.Enabled = true;
        }
    }
}
