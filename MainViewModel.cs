using LiveCharts;
using LiveCharts.Wpf;
using System.Collections.ObjectModel;

public class MainViewModel
{
    public SeriesCollection PieSeries { get; set; }
    public int TotalStockCount { get; set; }
    public decimal TotalStockAmount { get; set; }

    public MainViewModel()
    {
        PieSeries = new SeriesCollection
        {
            new PieSeries { Title = "A", Values = new ChartValues<double> { 30 } },
            new PieSeries { Title = "B", Values = new ChartValues<double> { 70 } }
        };
        TotalStockCount = 100;
        TotalStockAmount = 50000;
    }
}
