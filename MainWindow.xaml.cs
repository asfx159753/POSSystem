﻿using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace POSSystem
{
    /// <summary>
    /// MainWindow.xaml 的互動邏輯
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string account = loginAccount.Text;
            string password = loginPassWord.Text;
            if (LoginSevice.LoginCheck(account, password))
            {
                // 登入成功
                // 關閉MainWindow
                this.Hide();

                // 打開新的LoginWindow
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.Show();

            }
            else {
                //登入失敗
                MessageBox.Show("登入失敗。請檢查您的帳號和密碼。", "登入錯誤", MessageBoxButton.OK, MessageBoxImage.Error);
            };
        }

       
    }
}
