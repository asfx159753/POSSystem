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
        private bool isRegisterWindowOpen = false;
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
        private void CustomerRegister_Click(object sender, RoutedEventArgs e)
        {

            // 顯示RegisterWindow
            EmployeeRegisterWindow employeeRegisterWindow = new EmployeeRegisterWindow();
            employeeRegisterWindow.Show();
        }
        private void SupplyerRegisterAdd_Click(object sender, RoutedEventArgs e)
        {

            // 顯示RegisterWindow
            EmployeeRegisterWindow employeeRegisterWindow = new EmployeeRegisterWindow();
            employeeRegisterWindow.Show();
        }
        private void EmployeeRegisterAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!isRegisterWindowOpen)
            {
                // 顯示RegisterWindow
                EmployeeRegisterWindow employeeRegisterWindow = new EmployeeRegisterWindow();
                employeeRegisterWindow.Closed += (s, args) => isRegisterWindowOpen = false;
                employeeRegisterWindow.Show();
                isRegisterWindowOpen = true;
            }
        }
    }
}
