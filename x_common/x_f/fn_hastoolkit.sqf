// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_hastoolkit.sqf"
#include "..\..\x_setup.sqf"

#ifndef __IFA3LITE__
"ToolKit" in (items _this)
#else
"LIB_ToolKit" in (items _this)
#endif