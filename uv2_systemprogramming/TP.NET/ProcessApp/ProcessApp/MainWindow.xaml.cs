using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace ProcessApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private List<Process> listRunningProcesses;
        // nb max de processus 
        private static int maxNbRunningProcesses = 5;

        public MainWindow()
        {
            InitializeComponent();
            // liste des processus en cours 
            listRunningProcesses = new List<Process>();

            // ne pas afficher la liste au debut
            listBox.Visibility = Visibility.Hidden;
        }

        private void Run_Ballon(object sender, RoutedEventArgs e)
        {
            // verifier le nombre de processus
            if (NumberRunningProcesses() < maxNbRunningProcesses)
            {
                Process ballonProcess = new Process();
                ballonProcess.StartInfo.FileName = "Ballon.exe";
                // handler de la terminaison
                ballonProcess.EnableRaisingEvents = true;
                ballonProcess.Exited += new EventHandler(HandleProcessExited);
                // lancer
                ballonProcess.Start();
                AddToListRunningProcesses(ballonProcess);
                AddProcessToListView(ballonProcess);
            }
            else
            {
                ShowInfoDialog();
            }

        }

        private void Run_Premier(object sender, RoutedEventArgs e)
        {
            if (NumberRunningProcesses() < maxNbRunningProcesses)
            {
                Process premierProcess = new Process();
                premierProcess.StartInfo.FileName = "Premier.exe";
                // handler de la terminaison
                premierProcess.EnableRaisingEvents = true;
                premierProcess.Exited += new EventHandler(HandleProcessExited);
                // lancer
                premierProcess.Start();
                AddToListRunningProcesses(premierProcess);
                AddProcessToListView(premierProcess);
            }
            else
            {
                ShowInfoDialog();
            }
        }

        private void Delete_All_Processes(object sender, RoutedEventArgs e)
        {
            CloseAllRemainingProcesses();
            UpdateListBoxView();
        }

        private void Delete_Last_Process(object sender, RoutedEventArgs e)
        {
            if (NumberRunningProcesses() > 0)
            {
                // supprimer le dernier et mettre a jour la vue
                Process lastProcess = listRunningProcesses.ElementAt(listRunningProcesses.Count - 1);
                lastProcess.Kill();
                listRunningProcesses.Remove(lastProcess);
                UpdateListBoxView();
            }
            else
            {
                ShowWarningDialog("");
            }
        }

        private void Delete_Last_Ballon(object sender, RoutedEventArgs e)
        {
            if (NumberRunningBallons() > 0)
            {
                // supprimer le dernier ballon et mettre a jour la vue
                Process lastBallon = listRunningProcesses.FindLast(pr => IsBallonProcess(pr));
                lastBallon.Kill();
                listRunningProcesses.Remove(lastBallon);
                UpdateListBoxView();
            }
            else
            {
                ShowWarningDialog("ballon");
            }
        }

        private void Delete_Last_Premier(object sender, RoutedEventArgs e)
        {
            if (NumberRunningPremiers() > 0)
            {
                // supprimer le dernier ballon et mettre a jour la vue
                Process lastPremier = listRunningProcesses.FindLast(pr => IsPremierProcess(pr));
                lastPremier.Kill();
                listRunningProcesses.Remove(lastPremier);
                UpdateListBoxView();
            }
            else
            {
                ShowWarningDialog("premier");
            }
        }
        private void Show_Running_Processes(object sender, RoutedEventArgs e)
        {
            listBox.Visibility = Visibility.Visible;
        }

        // fermer la fenetre par le button Quitter
        private void Quit(object sender, RoutedEventArgs e)
        {
            // fermer la fenetre
            Close();
        }

        // fermer la fenetre par le button X
        private void Close_Window(object sender, CancelEventArgs e)
        {
            CloseAllRemainingProcesses();
        }

        private void AddToListRunningProcesses(Process p)
        {
            listRunningProcesses.Add(p);
        }

        private void AddProcessToListView(Process p)
        {
            ListBoxItem itm = new ListBoxItem();
            itm.Content = MakeContent(p);

            listBox.Items.Add(itm);
        }

        private string MakeContent(Process p)
        {
            string type;
            type = IsBallonProcess(p) ? "Processus Ballon" : "Processus Premier";

            return type + " ----- PId = " + p.Id;
        }

        private void HandleProcessExited(object sender, EventArgs e)
        {
            Process p = sender as Process;
            // le processus termine sur une autre thread que la thread base
            Dispatcher.Invoke(() =>
            {
                // enlever le processus fermé
                listRunningProcesses = listRunningProcesses.Where(pr => pr.Id != p.Id).ToList();

                listBox.Items.Clear();
                listRunningProcesses.ForEach(pr =>
                {
                    AddProcessToListView(pr);
                });
            });
        }

        private void CloseAllRemainingProcesses()
        {
            if (NumberRunningProcesses() > 0)
            {
                listRunningProcesses.ForEach(pr =>
                {
                    pr.EnableRaisingEvents = false;
                    pr.CloseMainWindow();
                    pr.Close();
                });
                listRunningProcesses.Clear();
            }
        }

        private void UpdateListBoxView()
        {
            listBox.Items.Clear();
            listRunningProcesses.ForEach(pr =>
            {
                AddProcessToListView(pr);
            });
        }

        private int NumberRunningProcesses()
        {
            return listRunningProcesses.Count;
        }

        private int NumberRunningBallons()
        {
            return listRunningProcesses.Where(pr => IsBallonProcess(pr)).ToList().Count;
        }

        private int NumberRunningPremiers()
        {
            return listRunningProcesses.Where(pr => IsPremierProcess(pr)).ToList().Count;
        }

        private void ShowInfoDialog()
        {
            MessageBox.Show("Vous avez ouvert 5 processus, fermez-en un pour continuer.", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void ShowWarningDialog(string type)
        {
            MessageBox.Show("Il n'y a aucun processus " + type + " en cours.", "Info", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private bool IsBallonProcess(Process p)
        {
            return p.StartInfo.FileName == "Ballon.exe";
        }

        private bool IsPremierProcess(Process p)
        {
            return p.StartInfo.FileName == "Premier.exe";
        }
    }
}
