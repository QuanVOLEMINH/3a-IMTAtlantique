using System;
using System.Collections.Generic;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace remotServeur
{
    /// <summary>
    /// Description r�sum�e de demarreServeur.
    /// </summary>
    public class Serveur : MarshalByRefObject, RemotingInterface.IRemotChaine
    {
        private List<string> onlineUsers;
        private String chatSession = "";
        private static void Main()

        {
            // pour dimentionner la fenetre
            Console.SetWindowSize(50, 5);

            // Cr�ation d'un nouveau canal pour le transfert des donn�es via un port 
            TcpChannel canal = new TcpChannel(12345);

            // Le canal ainsi d�fini doit �tre Enregistr� dans l'annuaire
            ChannelServices.RegisterChannel(canal, false);

            // D�marrage du serveur en �coute sur objet en mode Singleton
            // Publication du type avec l'URI et son mode 
            RemotingConfiguration.RegisterWellKnownServiceType(
                typeof(Serveur), "Serveur", WellKnownObjectMode.Singleton);

            Console.WriteLine("Le serveur est bien d�marr�");
            // pour garder la main sur la console
            Console.ReadLine();

            Serveur s = new Serveur();
            AppDomain.CurrentDomain.ProcessExit += new EventHandler(s.CurrentDomain_ProcessExit);

        }

        private void CurrentDomain_ProcessExit(object sender, EventArgs e)
        {
            ClearState();
        }

        public Serveur()
        {
            onlineUsers = new List<string>();
        }

        // Pour laisser le serveur fonctionner sans time out
        public override object InitializeLifetimeService()
        {
            return null;
        }


        #region Membres de IRemotChaine
        // impl�mentation de l'interface

        private readonly string chaine = "Un essai pour r�cup�rer les donn�es \n se trouvant sur le serveur ";
        public string Hello()
        {
            // TODO�: ajoutez l'impl�mentation de Serveur.Hello
            return chaine;
        }

        public bool JoinChatRoom(string userName)
        {
            if (onlineUsers.IndexOf(userName) == -1)
            {
                onlineUsers.Add(userName);
                Console.WriteLine(userName + " joined");
                return true;
            }
            else
            {
                return false;
            }

        }

        public List<string> GetMembers()
        {
            Console.WriteLine("get members");
            return onlineUsers;
        }

        public void SendMessage(string message)
        {
            Console.WriteLine("\"{0}\" message will be sent to all clients.", message);
        }

        public string ChatSession()
        {
            return chatSession;
        }

        public void AddText(string newText)
        {
            if (newText != null)
            {
                lock (chatSession)
                {
                    chatSession += newText + "\n";
                }
            }
        }

        #endregion

        private void ClearState()
        {
            onlineUsers.Clear();
        }


    }
}
