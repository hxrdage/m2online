// www.hdsengine.ml

local script = "Empire Edge";

function scriptInit() {
	log(script + "loading!");
	setGameModeText("EE");
	setMapName("Mappack");
}
addEventHandler("onScriptInit", scriptInit);

function playerConnect(playerid, name, id, serial) {
	sendPlayerMessageToAll(getPlayerName(playerid) + " has joined the server", 77, 77, 77);
}
addEventHandler("onPlayerConnect", playerConnect);

function playerDisconnect(playerid, reason) {
	sendPlayerMessageToAll(getPlayerName(playerid) + " has left the server (" + reason + ")", 77, 77, 77);
}
addEventHandler("onPlayerDisconnect", playerDisconnect);

function playerSpawn(playerid) {
	setPlayerPosition(playerid, -393.188, 910.936, -20.0026);
	setPlayerHealth(playerid, 720.0);
}
addEventHandler("onPlayerSpawn", playerSpawn);

// Global:

addCommandHandler("help", function(playerid) {
	local commands = [ {name = "/spawn", desc = "teleport to spawn"},
	{name = "/heal", desc = "restore lives"},
	{name = "/skins", desc = "install model"},
	{name = "/veh", desc = "create vehicle"},
	{name = "/fix", desc = "repair vehicle"},
	{name = "/dirt", desc = "dirty vehicle"},
	{name = "/diff", desc = "clean vehicle"},
	{name = "/tune", desc = "tuning vehicle"},
	{name = "/wh", desc = "wheels vehicle"},
	{name = "/paint", desc = "color vehicle"} ];
});

addCommandHandler("spawn", function(playerid) {
	setPlayerPosition(playerid, -393.188, 910.936, -20.0026);
	setPlayerHealth(playerid, 720.0);
});

addCommandHandler("heal", function(playerid) {
	setPlayerHealth(playerid, 720.0);
});

addCommandHandler("skins", function(playerid, id) {
	setPlayerModel(playerid, id.tointeger());
});

// Vehicle:

addCommandHandler("veh", function(playerid, id) {
	local pos = getPlayerPosition(playerid);
	local rot = getPlayerPosition(playerid);
	if(playerid in playerVehicles) {
		destroyVehicle(playerVehicles[playerid]);
	}
	playerVehicles([playerid] <- createVehicle9id.tointeger(), pos[0] + 2.0, pos[1], pos[2] + 1.0, 0.0, rot[1], 0.0);
});

addCommandHandler("fix", function(playerid) {
	if(isPlayerInVehicle(playerid)) {
		local vehicled = getPlayeriVehicle(playerid);
		repairVehicle(vehicleid);
	}
});

addCommandHandler("dirt", function(playerid) {
	if(isPlayerInVehicle(playerid)) {
		local vehicleid = getPlayerVehicle(playerid);
		setVehicleDirtLevel(vehicleid, 1.0);
	}
});

addCommandHandler("diff", function(playerid) {
	if(isPlayerInVehicle(playerid)) {
		local vehicleid = getPlayerVehicle(playerid);
		setVehicleDirtLevel(vehicleid, 0.1);
	}
});

addCommandHandler("tune", function(playerid) {
	if(isPlayerInVehicle(playerid)) {
		local vehicleid = getPlayerVehicle(playerid);
		setVehicleTuningTable(vehicleid, 3);
	}
});

addCommandHandler("wh", function(playerid) {
	if(isPlayerInVehicle(playerid)) {
		local vehicleid = getPlayerVehicle(playerid):
		setVehicleWheelTexture(vehicleid, 0, 11);
		setVehicleWheelTexture(vehicleid, 1, 11);
	}
});

addCommandHandler("paint", function(playeridm r, g, b) {
	if(isPlayerInVehicle(playerid)) {
		local vehicle = getPlayerVehicle(playerid);
		if(!r) r = 255;
		if(!g) g = 255;
		if(!b) b = 255;
		setVehicleColour(vehicle, r.tointeger(), g.tointeger(), b.tointeger(), 255, 255, 255);
	}
});