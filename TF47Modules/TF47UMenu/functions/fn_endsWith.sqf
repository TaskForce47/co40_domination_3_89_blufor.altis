/**
 *  @author Willard
 *  @description
 *  Checks if the a string ends with specific string
 *  @params
 *      param 0: The partial text <STRING> (required)
 *      param 1: The full text <STRING> (required)
 *  @return true if the string ends with the specific string, false otherwise
 */
_result = _this params [
    ["_partialText", "", [""]],
    ["_fullText", "", [""]]
];

// check for empty strings
if(_partialText == "" || _fullText == "") exitWith {
    ["endsWith called without a valid string!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// get the last part of the full text
_fullTextLenght = count (_fullText);
_subString = [_fullText, _fullTextLenght - (count _partialText), _fullTextLenght] call
    BIS_fnc_trimString;

// check if it ends with it
_return = (_subString == _partialText);

_return
