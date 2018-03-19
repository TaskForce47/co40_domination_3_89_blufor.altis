#include "TF47Modules\TF47UMenu\TF47UMenuMacros.hpp"

//Marker Name U-Menü: tf47_modules_umenu_ft_marker_start
// variables outside of config pls
_airCallsigns = ["RAVEN-01","RAVEN-02","DUSTOFF","BUTTERFLY-01","BUTTERFLY-02",
    "PELICAN","GRIFFIN","GOOSE","ALBATROS"];

_defaultColor = "ColorBLUFOR";
// Endung des Slots, Marker Typ, Marker Farbe, Bezeichnung, c/s
UMENU_CONFIG_BEGIN

["CMD", "b_hq", "ColorGreen", "Headquarters", ["GODFATHER","TOPMAN","TOWER"]],
["INF", "b_inf", _defaultColor, "Infantry", []],
["INF", "b_mortar", _defaultColor, "Mortar", []],
["INF", "b_support", _defaultColor, "Support", []],
["INF", "b_med", _defaultColor, "Medical Support", []],
["REC", "b_recon", _defaultColor, "Recon", []],
["MEC", "b_mech_inf",  "ColorOrange", "IFV",["TIGER-01","TIGER-02","TIGER-03",
    "GATOR-01","GATOR-02"]],
["ARM", "b_armor",  "ColorOrange", "Tank", ["RHINO-01","RHINO-02","LION-01",
    "LION-02", "FROG-01"]],
["HELO", "b_air",  "ColorBrown", "Helicopter (Trans.)", _airCallsigns],
["PLN", "b_plane",  "ColorBrown", "Plane (Trans.)", _airCallsigns],
["HELOA", "b_air", "ColorOrange", "Helicopter (Attack)", ["MANTICORE",
    "FIREFLY"]],
["PLNA", "b_plane", "ColorGreen", "Plane (Attack)", ["THUNDERBIRD","WASP",
    "EAGLE"]]

UMENU_CONFIG_END
