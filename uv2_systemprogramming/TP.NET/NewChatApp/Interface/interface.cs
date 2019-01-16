using System.Collections.Generic;

namespace RemotingInterface
{
    /// <summary>
    /// cette interface contiendra la déclaration de toutes les 
    /// méthodes de l'objet distribué
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
