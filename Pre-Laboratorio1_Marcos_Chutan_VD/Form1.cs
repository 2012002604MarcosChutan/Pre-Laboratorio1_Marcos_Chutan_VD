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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)  
        {
            string usuario = textBox1.Text;  // Se obtiene el valor ingresado por el usuario en el TextBox1 
            string contraseña = textBox2.Text;  // Se obtiene el valor ingresado por el usuario en el TextBox2 

            if (usuario == "m.chutan.1adb@gmail.com" && contraseña == "12345")  // Verifica si el usuario y la contraseña son correctos
            {
                Form2 ventanaPrincipal = new Form2();  // Si el usaurio y contraseñas son correctas, se crea una nueva instancia de Form2
                ventanaPrincipal.Show();  // Se muestra el segundo formulario
                this.Hide();  // Se oculta el formulario actual para que no se vea mientras el usuario está en el nuevo formulario
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);  // Si el usuario y/o contraseña son incorrectas, se muestra un mensaje de error
            }
        }
    }
 }

