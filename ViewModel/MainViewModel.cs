/// <Summary>
/// Author : R. Arun Mutharasu
/// Created :25-01-2022
/// YouTube Channel : C# Design Pro 
/// </Summary>   

using System.ComponentModel;
using System.Windows.Input;
using System.Windows;
using System;

namespace POSSystem.ViewModel
{
    public class MainViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propName));
        }

        // Close App
        public void CloseApp(object obj)
        {
            // 將 obj 資料輸出到控制台
            Console.WriteLine($"Object type: {obj?.GetType()}");
            Console.WriteLine($"Object content: {obj?.ToString()}");

            if (obj is MainWindow win)
            {
                win.Close();
            }
        }

        // Maximize App
        public void MaxApp(object obj)
        {
            // 將 obj 資料輸出到控制台
            Console.WriteLine($"Object type: {obj?.GetType()}");
            Console.WriteLine($"Object content: {obj?.ToString()}");

            if (obj is MainWindow win)
            {
                win.WindowState = win.WindowState == WindowState.Normal ? WindowState.Maximized : WindowState.Normal;
            }
        }

        public MainViewModel()
        {
            // Set SideMenu Visibility 
            IsPanelVisible = false;

            // Initialize commands
            _closeCommand = new RelayCommand(p => CloseApp(p));
            _maxCommand = new RelayCommand(p => MaxApp(p));
            _showMenuCommand = new RelayCommand(p => ShowMenu());
            _closeMenuCommand = new RelayCommand(p => CloseMenu());
            _openEmployeeListCommand = new RelayCommand(p => OpenEmployeeList());
        }

        // Show Menu
        public void ShowMenu()
        {
            IsPanelVisible = true;
        }

        // Close Menu
        public void CloseMenu()
        {
            IsPanelVisible = false;
        }

        //open Employee Window
        public void OpenEmployeeList()
        {
            EmployeeList employeeList = new EmployeeList();
            employeeList.Show();
        }

        // Commands
        private readonly ICommand _closeCommand;
        public ICommand CloseAppCommand => _closeCommand;

        private readonly ICommand _maxCommand;
        public ICommand MaxAppCommand => _maxCommand;

        private readonly ICommand _showMenuCommand;
        public ICommand ShowMenuCommand => _showMenuCommand;

        private readonly ICommand _closeMenuCommand;
        public ICommand CloseMenuCommand => _closeMenuCommand;

        private readonly ICommand _openEmployeeListCommand;
        public ICommand OpenEmployeeListCommand => _openEmployeeListCommand;

        private bool _isPanelVisible;
        public bool IsPanelVisible
        {
            get => _isPanelVisible;
            set
            {
                _isPanelVisible = value;
                OnPropertyChanged(nameof(IsPanelVisible));
            }
        }
    }
}
