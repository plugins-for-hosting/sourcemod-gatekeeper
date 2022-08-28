stock bool IsValidClient(int client, bool replaycheck = true)
{
	if(client <= 0 || client > MaxClients)
		return false;

	if(!IsClientConnected(client))
		return false;

	if(!IsClientInGame(client))
		return false;

	if(GetEntProp(client, Prop_Send, "m_bIsCoaching"))
		return false;

	if(replaycheck && (IsClientSourceTV(client) || IsClientReplay(client)))
		return false;
	
	return true;
}

/*
void LogPlayers(int player, int maxplayer)
{
    Database db = db_ConnectToDB();
    
    if(db == null)
    {
        return;
    }

    db_InsertServerPlayer(db, g_sServerIdentifier, player, maxplayer);

    delete db;
}
*/