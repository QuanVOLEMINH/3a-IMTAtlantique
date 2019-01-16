using System.Collections.Generic;

namespace RemotingInterface
{
    /// <summary>
    /// cette interface contiendra la d�claration de toutes les 
    /// m�thodes de l'objet distribu�
    /// </summary>

    public interface IRemotChaine
    {
        string Hello();
        bool JoinChatRoom(string userName);
        List<string> GetMembers();

        void SendMessage(string message);
        void AddText(string message);
        string ChatSession();
    }
}
