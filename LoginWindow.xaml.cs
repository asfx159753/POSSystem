using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace POSSystem
{
    /// <summary>
    /// LoginWindow.xaml 的互動邏輯
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void Sale_Click(object sender, RoutedEventArgs e)
        {

        }

        private void InWarehouse_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Analysis_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            // 登出隱藏
            this.Hide();

            // 顯示MainWindow
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
        }
    }
}
