#define AIR 1
#define TANK 2
#define CCT 3

#define ON true
#define OFF false

#define WHITELIST(STATE)  tf47_core_whitelistActive = STATE;\
    publicVariable "tf47_core_whitelistActive";
#define WHITELIST_SYSTEM(STATE) tf47_core_whitelistSystem = STATE;\
    publicVariable "tf47_core_whitelistSystem";

#define REGISTER_SLOT_BEGIN tf47_core_whitelistedSlots = [
#define REGISTER_SLOT(SLOTNAME, WHITELISTID) [SLOTNAME, WHITELISTID],
#define REGISTER_SLOT_END ["tf47_core_slotDefault", 0]];\
    publicVariable "tf47_core_whitelistedSlots";

#define TICKETSYSTEM(STATE) tf47_core_ticketsystem_active = STATE;\
    publicVariable "tf47_core_ticketsystem_active";
#define TICKETSYSTEM_MISSIONID(MISSIONID) tf47_core_ticketsystem_missionId =\
    MISSIONID; publicVariable "tf47_core_ticketsystem_missionId";
#define TICKETSYSTEM_MISSIONAME(MISSIONNAME) tf47_core_ticketsystem_missionName\
    = MISSIONNAME; publicVariable "tf47_core_ticketsystem_missionName";

#define TICKETSYSTEM_DETECTION_MODE(STATE) tf47_core_ticketSystemDetectionMode\
    = STATE; publicVariable "tf47_core_ticketSystemDetectionMode";

#define TICKETSYSTEM_MARKER_TRACKING_DELAY(DELAY) tf47_core_ticketsystem_trackingMarkerUpdate\
    = DELAY; publicVariable "tf47_core_ticketsystem_trackingMarkerUpdate";

#define TICKETSYSTEM_DESERTION_TIME(TIME) tf47_core_ticketsystem_desertionTime\
    = TIME; publicVariable "tf47_core_ticketsystem_desertionTime";

#define TICKETSYSTEM_DESERTION_MARKER(MARKER) tf47_core_ticketsystem_desertionMarker\
    = MARKER; publicVariable "tf47_core_ticketsystem_desertionMarker";

#define TICKETSYSTEM_TICKETS_START(COUNT) tf47_core_ticketsystem_tickets\
    = COUNT; publicVariable "tf47_core_ticketsystem_tickets";
#define TICKETSYSTEM_SOFTCAP(COUNT) tf47_core_ticketsystem_softcap\
    = COUNT; publicVariable "tf47_core_ticketsystem_softcap";
#define TICKETSYSTEM_HARDCAP(COUNT) tf47_core_ticketsystem_hardcap\
    = COUNT; publicVariable "tf47_core_ticketsystem_hardcap";

#define TICKETSYSTEM_TRACKING(STATE) tf47_core_ticketsystem_trackingActive\
    = STATE; publicVariable "tf47_core_ticketsystem_trackingActive";
#define TICKETSYSTEM_TRACKING_DEFAULT(COLOR)\
    tf47_core_ticketsystem_trackingDefault\
    = COLOR; publicVariable "tf47_core_ticketsystem_trackingDefault";
#define TICKETSYSTEM_TRACKING_ATTACK(COLOR)\
    tf47_core_ticketsystem_trackingAttack\
    = COLOR; publicVariable "tf47_core_ticketsystem_trackingAttack";
#define TICKETSYSTEM_TRACKING_TRANSPORT(COLOR)\
    tf47_core_ticketsystem_trackingTransport\
    = COLOR; publicVariable "tf47_core_ticketsystem_trackingTransport";

#define REGISTER_DEFAULT(TICKETS) tf47_core_ticketsystem_defaultTickets\
    = TICKETS; publicVariable "tf47_core_ticketsystem_defaultTickets";


#define REGISTER_SLOT_TICKETCOST_BEGIN tf47_core_ticketsystem_slotCost = [
#define REGISTER_TICKETCOST(SLOTNAME, COST) [SLOTNAME, COST],
#define REGISTER_SLOT_TICKETCOST_END ["objNull", 0]];\
    publicVariable "tf47_core_ticketsystem_slotCost";

#define REGISTER_VEHICLE_TICKETCOST(VEHICLE, COST) [VEHICLE, COST] call\
    tf47_core_ticketsystem_fnc_registerVehicle;


tf47_core_whitelist_uavWhitelist = [];
publicVariable "tf47_core_whitelist_uavWhitelist";