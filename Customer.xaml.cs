using System;
using System.Collections.ObjectModel;
using System.Data;
using System.IO;
using System.Windows;
using Microsoft.Win32;
using ExcelDataReader;

namespace POSSystem
{
    public partial class CustomerWindow : Window
    {
        public ObservableCollection<Customer> CustomerList { get; set; } = new ObservableCollection<Customer>();
        private string _selectedExcelFilePath;

        public CustomerWindow()
        {
            InitializeComponent();
            this.DataContext = this;
            UploadButton.Click += UploadButton_Click;
            ImportButton.Click += ImportButton_Click;
        }

        private void UploadButton_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog
            {
                Filter = "Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls",
                Title = "選擇 Excel 檔案"
            };
            if (openFileDialog.ShowDialog() == true)
            {
                _selectedExcelFilePath = openFileDialog.FileName;
                MessageBox.Show("已選擇檔案：" + Path.GetFileName(_selectedExcelFilePath), "提示", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void ImportButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(_selectedExcelFilePath) || !File.Exists(_selectedExcelFilePath))
            {
                MessageBox.Show("請先選擇 Excel 檔案！", "錯誤", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                using (var stream = File.Open(_selectedExcelFilePath, FileMode.Open, FileAccess.Read))
                {
                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    {
                        var result = reader.AsDataSet();
                        var table = result.Tables[0]; // 取第一個工作表

                        CustomerList.Clear();
                        for (int i = 1; i < table.Rows.Count; i++) // 假設第一列是標題
                        {
                            var row = table.Rows[i];
                            CustomerList.Add(new Customer
                            {
                                Name = row[0]?.ToString(),
                                Phone = row[1]?.ToString(),
                                Address = row[2]?.ToString(),
                                Email = row[3]?.ToString()
                            });
                        }
                    }
                }
                MessageBox.Show("匯入成功！", "提示", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("匯入失敗：" + ex.Message, "錯誤", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }

    public class Customer
    {
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
    }
}
