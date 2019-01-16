using RemotingInterface;
using System;
using System.Collections.Generic;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Threading;
using System.Windows;
using System.Windows.Threading;

namespace ChatClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private IRemotChaine LeRemot;
        private Thread th;

        public MainWindow()
        {
            InitializeComponent();

            TcpChannel canal = new TcpChannel();

            // enregistrement du canal
            ChannelServices.RegisterChannel(canal);

            LeRemot = (IRemotChaine)Activator.GetObject(
                typeof(IRemotChaine), "tcp://localhost:12345/Serveur");

        }


        private void Login_Click(object sender, RoutedEventArgs e)
        {
            LeRemot.JoinChatRoom(textBox_name.Text);
            th = new Thread(new ThreadStart(PollServer));
            th.Start();
        }

        private void InitializeRemoteServer()
        {
            RemotingConfiguration.RegisterWellKnownClientType(typeof(IRemotChaine), "http://localhost:12345/Serveur");
        }

        private void Send_Message_Click(object sender, RoutedEventArgs e)
        {
            string toSend = textBox_name.Text + ": ";
            LeRemot.AddText(toSend + textBox_message.Text);
        }

        private void PollServer()
        {
            for (; ; )
            {
                Thread.Sleep(1000);
                List<string> users = LeRemot.GetMembers();
                Dispatcher.Invoke(
                         DispatcherPriority.SystemIdle,
                         new Action(
                             delegate ()
                             {
                                 listBox.Items.Clear();
                                 foreach (string userName in users)
                                 {
                                     listBox.Items.Add(userName);
                                 }
                                 string sessionText = LeRemot.ChatSession();
                                 textBox_chat.Clear();
                                 textBox_chat.Text = sessionText;
                             }));
            }
        }
    }
}
