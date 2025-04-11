using POSSystem.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Inventory.xaml 的互動邏輯
    /// </summary>
    public partial class InventoryWindow : Window
    {
        public InventoryWindow()
        {

            InitializeComponent();
            DataContext = new InventoryViewModel();

        }

        public class InventoryViewModel
        {
            public ObservableCollection<Product> InventoryList { get; set; }
            public ObservableCollection<Parameters> ColorList { get; set; }
            public ObservableCollection<Parameters> CategoryList { get; set; }
            public ObservableCollection<Supplier> SupplierList { get; set; }

            public InventoryViewModel()
            {
                InventoryList = new ObservableCollection<Product>();
                ColorList = new ObservableCollection<Parameters>(InventorySQLService.GetColorList());
                CategoryList = new ObservableCollection<Parameters>(InventorySQLService.GetCategoryList());
                SupplierList = new ObservableCollection<Supplier>(InventorySQLService.GetSupplierList());

                // 添加預設項目
                ColorList.Insert(0, new Parameters { Name = "請選擇", Value = "" });
                CategoryList.Insert(0, new Parameters { Name = "請選擇", Value = "" });
                SupplierList.Insert(0, new Supplier { Name = "請選擇", Barcode = "" });

                // 生成假資料
                GenerateDummyData();

            }

            private void GenerateDummyData()
            {
                for (int i = 1; i <= 50; i++)
                {
                    InventoryList.Add(new Product
                    {
                        Name = $"商品名稱 {i}",
                        Code = $"商品代號 {i}",
                        Id = i 
                    });
                }
            }


        }


        private void BarCodeButton_Click(object sender, RoutedEventArgs e)
        {
            if (BarCodeTextBox.IsEnabled)
                BarCodeTextBox.IsEnabled = false;
            else
                BarCodeTextBox.IsEnabled = true;
        }

    }
}
