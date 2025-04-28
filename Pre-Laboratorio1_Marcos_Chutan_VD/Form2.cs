using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Pre_Laboratorio1_Marcos_Chutan_VD
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form3 form3 = new Form3(); // Crea una nueva instancia del Form3
            form3.Show(); // Muestra el Form3
            this.Hide(); // Oculta el formulario actual
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form4 form4 = new Form4(); // Crea una nueva instancia del Form4
            form4.Show(); // Muestra el Form4
            this.Hide(); // Oculta el formulario actual
        }
    }
}
