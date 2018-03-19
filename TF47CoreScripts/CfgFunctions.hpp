class tf47_core
{
    class tf47_core
    {
        file = "TF47CoreScripts";
        class initDatabase {};
        class initTicketsystem {};
        class initPlayer {};
        class init {};
    };
};

class tf47_core_util
{
    class tf47_core_util
    {
        file = "TF47CoreScripts\functions\util";
        class getMarkerType {};
    };
};

class tf47_core_whitelist
{
    class tf47_core_whitelist
    {
        file = "TF47CoreScripts\functions\whitelist";
        class registerWhitelist {};
        class checkWhitelist {};
        class checkSlotWhitelist {};
        class registerUavWhitelist {};
        class checkWhitelistUav {};
    };
};

class tf47_core_ticketsystem
{
    class tf47_core_ticketsystem
    {
        file = "TF47CoreScripts\functions\ticketsystem";
        class registerVehicle {};
        class changeTickets {};
        class trackVehicle {};
        class insertTicketlog {};
        class handleDesertion {};
        class onPlayerRespawn {};
    };
};
