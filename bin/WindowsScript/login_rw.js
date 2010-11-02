/* login_rw.js: create custom mappings to override certain drive mappings
 * Author: Thijs Brobbel
 * skeleton copied from \\pdc\NETLOGON\logon_UT.js */

var wshNetwork = WScript.CreateObject("WScript.Network");

/* here the error will be visible, if the operation doesn't succeed. That's in
 * fact something I do want to see */
wshNetwork.RemoveNetworkDrive("k:", true, true);
wshNetwork.MapNetworkDrive("k:", "\\\\realworld\\data\\projects\\UT\\orca");
