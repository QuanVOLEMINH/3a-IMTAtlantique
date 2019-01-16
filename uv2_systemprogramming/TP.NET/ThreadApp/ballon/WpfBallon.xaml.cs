using System.ComponentModel;
using System.Windows;


namespace WpfAppliTh
{
    /// <summary>
    /// Interaction logic for WindowBallon.xaml
    /// </summary>
    public partial class WindowBallon : Window
    {
        public WindowBallon()
        {
            InitializeComponent();
        }

        public WindowBallon(WindowBallon windowBallon)
        {
            InitializeComponent();
        }

        public void NewWinDowBallonThread()
        {
            WindowBallon tempWindow = new WindowBallon(this);
            tempWindow.Show();
            System.Windows.Threading.Dispatcher.Run();
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            MessageBoxResult key = MessageBox.Show(
               "Etes-vous sûre de vouloir quitter",
               "Confirmez",
               MessageBoxButton.YesNo,
                MessageBoxImage.Question,
                MessageBoxResult.No);
            if (!(e.Cancel = (key == MessageBoxResult.No)))
            {
                e.Cancel = false;
            }
        }
    }
}
