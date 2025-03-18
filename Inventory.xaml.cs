using POSSystem.Model;
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
            public List<Parameters> ColorList { get; set; }

            public InventoryViewModel()
            {
                ColorList = SQLService.GetColorList();
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
