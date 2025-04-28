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
    public partial class Form3 : Form
    {
        private int filaSeleccionada = -1; // Declara una variable para guardar la fila seleccionada, inicializada en -1

        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Captura los datos de los cuadros de texto y los guarda en variables
            string nombre = textBox1.Text;
            string grado = textBox2.Text;
            string seccion = textBox3.Text;
            string telefono = textBox4.Text;
            string matricula = textBox5.Text;
            string ciclo = textBox6.Text;
            string nodecursos = textBox7.Text;
            string materiafavorita = textBox8.Text;
            string materiaperdida = textBox9.Text;
            string materiamascomplicada = textBox10.Text;
            string profesorfavorito = textBox11.Text;

            // Agrega una nueva fila al DataGridView con los datos capturados.
            dataGridView1.Rows.Add(nombre, grado, seccion, telefono, matricula, ciclo, nodecursos, materiafavorita, materiaperdida, materiamascomplicada, profesorfavorito);

            MessageBox.Show("Datos guardados."); // Muestra un mensaje indicando que los datos se guardaron
        }

        private void LimpiarCampos() // Método para limpiar todos los cuadros de texto del formulario
        {
            foreach (Control c in this.Controls) // Recorre todos los controles del formulario
            {
                if (c is TextBox) // Si el control es un TextBox
                    c.Text = ""; //  Se limpia su contenido.
            }
        }
        private void button3_Click_1(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentRow != null) // Verifica que haya una fila seleccionada en el DataGridView
            {
                dataGridView1.Rows.Remove(dataGridView1.CurrentRow); // Elimina la fila seleccionada
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {

            if (dataGridView1.CurrentRow != null) // Verifica que haya una fila seleccionada en el DataGridView
            {
                int fila = dataGridView1.CurrentRow.Index; // Obtiene el índice de la fila seleccionada

                // Actualiza los valores de la fila seleccionada con los textos de los TextBox
                dataGridView1.Rows[fila].Cells[0].Value = textBox1.Text;
                dataGridView1.Rows[fila].Cells[1].Value = textBox2.Text;
                dataGridView1.Rows[fila].Cells[2].Value = textBox3.Text;
                dataGridView1.Rows[fila].Cells[3].Value = textBox4.Text;
                dataGridView1.Rows[fila].Cells[4].Value = textBox5.Text;
                dataGridView1.Rows[fila].Cells[5].Value = textBox6.Text;
                dataGridView1.Rows[fila].Cells[6].Value = textBox7.Text;
                dataGridView1.Rows[fila].Cells[7].Value = textBox8.Text;
                dataGridView1.Rows[fila].Cells[8].Value = textBox9.Text;
                dataGridView1.Rows[fila].Cells[9].Value = textBox10.Text;
                dataGridView1.Rows[fila].Cells[10].Value = textBox11.Text;

                LimpiarCampos(); // Limpia los campos de texto después de actualizar

                filaSeleccionada = -1; // Reinicia la variable de fila seleccionada

                MessageBox.Show("Alumno actualizado correctamente."); // Muestra un mensaje confirmando la actualización
            }
        }
    }
}


