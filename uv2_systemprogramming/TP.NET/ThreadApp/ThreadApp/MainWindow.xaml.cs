using ClassLibrary1;
using System.Collections.Generic;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using WpfAppliTh;
namespace ThreadApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private List<Thread> listThreads;
        private List<MyThread> listRunningThreads;
        private int nbBallons;
        private int nbPremiers;
        private static ManualResetEvent mre = new ManualResetEvent(true);
        private static readonly int MAX_RUNNING_THREAD = 5;
        private bool running;
        public MainWindow()
        {
            InitializeComponent();

            // init state
            listThreads = new List<Thread>();
            listRunningThreads = new List<MyThread>();
            nbBallons = 0;
            nbPremiers = 0;
            running = true;

            // init listbox
            InitListBox();
        }

        private void Run_Ballon_Thread(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyPlaceLeft())
            {
                WindowBallon wb = new WindowBallon();
                Thread ballonThread = new Thread(new ThreadStart(wb.NewWinDowBallonThread));
                ballonThread.SetApartmentState(ApartmentState.STA);
                ballonThread.Start();
                listThreads.Add(ballonThread);
                listRunningThreads.Add(new MyThread("ballon", ballonThread.ManagedThreadId));
                nbBallons++;
                UpdateListBox();
            }
            else
            {
                ShowInfoDialog();
            }

        }


        private void Run_Premier_Thread(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyPlaceLeft())
            {
                ConsolePremier cp = new ConsolePremier();
                Thread premierThread = new Thread(new ThreadStart(cp.NombresPremiers));
                // fermer quand l'app termine
                premierThread.IsBackground = true;
                premierThread.Start();
                listThreads.Add(premierThread);
                listRunningThreads.Add(new MyThread("premier", premierThread.ManagedThreadId));
                nbPremiers++;
                UpdateListBox();
            }
            else
            {
                ShowInfoDialog();
            }

        }

        private void Quit(object sender, RoutedEventArgs e)
        {
            CloseAllRemainingThreads();
            Close();
        }

        private void Delete_Last_Thread(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyRunningThread())
            {
                Thread lt = listThreads[listThreads.Count - 1];
                listThreads.Remove(lt);
                lt.Abort();

                MyThread mlt = listRunningThreads[listRunningThreads.Count - 1];
                if (MyThread.IsBallonThread(mlt))
                {
                    nbBallons--;
                }
                else
                {
                    nbPremiers--;
                }
                listRunningThreads.Remove(mlt);
                UpdateListBox();
            }
            else
            {
                ShowWarningDialog("");
            }

        }

        private void Delete_Last_Premier(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyRunningPremier())
            {
                MyThread lastPremier = listRunningThreads.FindLast(mt => MyThread.IsPremierThread(mt));
                if (lastPremier != null)
                {
                    nbPremiers--;
                    Thread lpt = listThreads.FindLast(t => t.ManagedThreadId == lastPremier.Id);
                    lpt.Abort();
                    listThreads.Remove(lpt);
                    listRunningThreads.Remove(lastPremier);
                    UpdateListBox();
                }
            }
            else
            {
                ShowWarningDialog("premier");
            }
        }

        private void Delete_Last_Ballon(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyRunningBallon())
            {
                MyThread lastBallon = listRunningThreads.FindLast(mt => MyThread.IsBallonThread(mt));
                if (lastBallon != null)
                {
                    nbBallons--;
                    Thread lbt = listThreads.FindLast(t => t.ManagedThreadId == lastBallon.Id);
                    lbt.Abort();
                    listThreads.Remove(lbt);
                    listRunningThreads.Remove(lastBallon);
                    UpdateListBox();
                }
            }
            else
            {
                ShowWarningDialog("ballon");
            }

        }

        private void Delete_All_Threads(object sender, RoutedEventArgs e)
        {
            if (IsThereAnyRunningThread())
            {
                CloseAllRemainingThreads();
                ClearState();
                UpdateListBox();
            }
            else
            {
                ShowWarningDialog("");
            }
        }

        private void CloseAllRemainingThreads()
        {
            listThreads.ForEach(t =>
            {
                t.Abort();
            });
        }

        private void InitListBox()
        {
            listBox.Items.Clear();

            // add nb
            ListBoxItem nbBallon = new ListBoxItem() { Content = "Nbr Ballon = " + nbBallons };
            listBox.Items.Add(nbBallon);
            ListBoxItem nbPremier = new ListBoxItem() { Content = "Nbr Premier = " + nbPremiers };
            listBox.Items.Add(nbPremier);

            // add line
            ListBoxItem line = new ListBoxItem() { Content = "=====" };
            listBox.Items.Add(line);
        }

        private void UpdateListBox()
        {
            InitListBox();
            int k = 0;
            listRunningThreads.ForEach(t =>
            {
                k++;
                ListBoxItem i = new ListBoxItem();
                i.Content = k + ". " + t.ToString();
                listBox.Items.Add(i);
            });
        }


        private void Pause_Resume(object sender, RoutedEventArgs e)
        {
            if (running)
            {
                listThreads.ForEach(t =>
                {
                    t.Suspend();
                });
                running = false;
            }
            else
            {
                listThreads.ForEach(t =>
                {
                    t.Resume();
                });
                running = true;
            }
            
        }

        private void ClearState()
        {
            listThreads.Clear();
            listRunningThreads.Clear();
            nbPremiers = 0;
            nbBallons = 0;
        }

        private bool IsThereAnyRunningThread()
        {
            return listThreads.Count > 0;
        }

        private bool IsThereAnyRunningBallon()
        {
            return nbBallons > 0;
        }

        private bool IsThereAnyRunningPremier()
        {
            return nbPremiers > 0;
        }

        private void ShowInfoDialog()
        {
            MessageBox.Show("Vous avez ouvert 5 threads, fermez-en un pour continuer.", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void ShowWarningDialog(string type)
        {
            MessageBox.Show("Il n'y a aucun thread " + type + " en cours.", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private bool IsThereAnyPlaceLeft()
        {
            return listThreads.Count < MAX_RUNNING_THREAD;
        }
    }
}
