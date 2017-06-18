#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "TheDarkSid3r"
#define PLUGIN_VERSION "1.20"

#include <sourcemod>
#include <sdktools>
#include <morecolors>
#include <tf2>
#include <tf2_stocks>
//#include <sdkhooks>

public Plugin myinfo = 
{
	name = "/me Plugin",
	author = PLUGIN_AUTHOR,
	description = "Allows clients to use /me",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	LogMessage("---Initializing me.smx(v%s)---", PLUGIN_VERSION);
	
	RegAdminCmd("sm_me", Command_ME, ADMFLAG_CHAT, "Use /me");
	RegAdminCmd("sm_me_action",Command_MEAction, ADMFLAG_CHAT, "Use /me_action");
	
	CreateConVar("me_version", PLUGIN_VERSION, "Version for the /me plugin!Do not change!");
}

public void OnPluginEnd()
{
	LogMessage("---Disabling me.smx(v%s)---", PLUGIN_VERSION);
}

public Action Command_MEAction(int client, int args)
{
	if (args <= 0) 
	{
		CPrintToChat(client, "{gold}[{cyan}me.smx{gold}]{red}You need to specify at least 1 argument!{default}");
	} 
	else
	{
		char inString[256];
		char outString[256];
		char clientName[256];

		GetCmdArgString(inString, sizeof(inString));
		GetClientName(client, clientName, sizeof(clientName));
	
		Format(outString, sizeof(outString), "{darkgreen}%s {aqua}%s{default}", clientName, inString);
	
		CPrintToChatAll(outString);
	}
	return Plugin_Handled;
}

public Action Command_ME(int client, int args)
{
	if (args <= 0) 
	{
		CPrintToChat(client, "{gold}[{cyan}me.smx{gold}]{red}You need to specify at least 1 argument!{default}");
	} 
	else
	{
		char inString[256];
		char outString[256];
		char clientName[256];

		GetCmdArgString(inString, sizeof(inString));
		GetClientName(client, clientName, sizeof(clientName));
	
		Format(outString, sizeof(outString), "{darkgreen}%s{default}:{aqua}%s{default}", clientName, inString);
	
		CPrintToChatAll(outString);
	}
	return Plugin_Handled;
}