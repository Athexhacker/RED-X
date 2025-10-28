#!/bin/bash

# Text colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Animation variables
ANIMATION_SPEED=0.05
TOOLS_PER_PAGE=30

# Tool data structure
declare -A tools
declare -a tool_names

# Initialize tools data
initialize_tools() {
    # Tool format: tools[name]="display_name|category|url|install_method|dependencies"
    tools["4nonimizer"]="4nonimizer|null|https://github.com/Hackplayers/4nonimizer.git|git|git"
    tools["A-Rat"]="A-Rat|exploitation_tools|https://github.com/Xi4u7/A-Rat.git|git|python,git"
    tools["ADB-Toolkit"]="ADB-Toolkit|null|https://github.com/ASHWIN990/ADB-Toolkit.git|git|git"
    tools["ATSCAN"]="ATSCAN|exploitation_tools|https://github.com/AlisamTechnology/ATSCAN.git|git|git"
    tools["AndroBugs_Framework"]="AndroBugs_Framework|null|https://github.com/AndroBugs/AndroBugs_Framework.git|git|python,git"
    tools["Androspy"]="Androspy|null|https://github.com/TunisianEagles/Androspy.git|git|git"
    tools["AutoPixieWps"]="AutoPixieWps|null|https://github.com/nxxxu/AutoPixieWps.git|git|python,git"
    tools["Automater"]="TekDefense-Automater|information_gathering|https://github.com/1aN0rmus/TekDefense-Automater.git|git|python,git"
    tools["Auxscan"]="Auxscan|null|https://github.com/Gameye98/Auxscan.git|git|python,git"
    tools["BAF"]="BAF|null|https://github.com/engMaher/BAF.git|git|python,git"
    tools["BadMod"]="BadMod|null|https://github.com/MrSqar-Ye/BadMod.git|git|php,git"
    tools["BeeLogger"]="BeeLogger|null|https://github.com/4w4k3/BeeLogger.git|git|python,git"
    tools["Black-Hydra"]="Black-Hydra|null|https://github.com/Gameye98/Black-Hydra.git|git|python,git"
    tools["Blazy"]="Blazy|null|https://github.com/UltimateHackers/Blazy.git|git|python,git"
    tools["Breacher"]="Breacher|web_hacking|https://github.com/UltimateHackers/Breacher.git|git|python,git"
    tools["Brutal"]="Brutal|exploitation_tools|https://github.com/Screetsec/Brutal.git|git|git"
    tools["BruteX"]="BruteX|web_hacking|https://github.com/1N3/BruteX.git|git|python,git"
    tools["CHAOS"]="CHAOS|null|https://github.com/tiagorlampert/CHAOS.git|git|golang,git"
    tools["CMSeeK"]="CMSeeK|null|https://github.com/Tuhinshubhra/CMSeeK.git|git|python,git"
    tools["CMSmap"]="CMSmap|information_gathering|https://github.com/Dionach/CMSmap.git|git|python,git"
    tools["CeWL"]="CeWL|password_attack|https://github.com/digininja/CeWL.git|git|ruby,git"
    tools["Clickjacking-Tester"]="Clickjacking-Tester|null|https://github.com/D4Vinci/Clickjacking-Tester.git|git|python,git"
    tools["Cookie-stealer"]="Cookie-stealer|null|https://github.com/Xyl2k/Cookie-stealer.git|git|php,git"
    tools["CrawlBox"]="CrawlBox|null|https://github.com/abaykan/CrawlBox.git|git|python,git"
    tools["CredSniper"]="CredSniper|null|https://github.com/ustayready/CredSniper.git|git|python,git"
    tools["Crips"]="Crips|information_gathering|https://github.com/Manisso/Crips.git|git|python,git"
    tools["CyberScan"]="CyberScan|null|https://github.com/medbenali/CyberScan.git|git|python,git"
    tools["D-TECT"]="D-TECT|information_gathering,vulnerability_scanner|https://github.com/shawarkhanethicalhacker/D-TECT.git|git|python,git"
    tools["DHCPig"]="DHCPig|stress_testing|https://github.com/kamorin/DHCPig.git|git|python,git"
    tools["DKMC"]="DKMC|null|https://github.com/Mr-Un1k0d3r/DKMC.git|git|python,git"
    tools["DSSS"]="DSSS|vulnerability_scanner|https://github.com/stamparm/DSSS.git|git|python,git"
    tools["DSVW"]="DSVW|null|https://github.com/stamparm/DSVW.git|git|python,git"
    tools["DSXS"]="DSXS|null|https://github.com/stamparm/DSXS.git|git|python,git"
    tools["Devploit"]="Devploit|information_gathering|https://github.com/joker25000/Devploit.git|git|python,git"
    tools["Dr0p1t-Framework"]="Dr0p1t-Framework|null|https://github.com/D4Vinci/Dr0p1t-Framework.git|git|python,git"
    tools["Dracnmap"]="Dracnmap|null|https://github.com/Screetsec/Dracnmap.git|git|git"
    tools["EagleEye"]="EagleEye|null|https://github.com/ThoughtfulDev/EagleEye.git|git|python,git"
    tools["EasY_HaCk"]="EasY_HaCk|null|https://github.com/sabri-zaki/EasY_HaCk.git|git|python,git"
    tools["EggShell"]="EggShell|null|https://github.com/neoneggplant/EggShell.git|git|python,git"
    tools["Email-Spammer"]="Email-Spammer|null|https://github.com/Juniorn1003/Email-Spammer.git|git|python,git"
    tools["Empire"]="Empire|null|https://github.com/EmpireProject/Empire.git|git|git"
    tools["EvilURL"]="EvilURL|information_gathering|https://github.com/UndeadSec/EvilURL.git|git|python,git"
    tools["ExploitOnCLI"]="ExploitOnCLI|exploitation_tools|https://github.com/r00tmars/ExploitOnCLI.git|git|php,git"
    tools["EyeWitness"]="EyeWitness|information_gathering|https://github.com/FortyNorthSecurity/EyeWitness.git|git|python,git"
    tools["FBUPv2.0"]="FBUPv2.0|null|https://github.com/mrSilent0598/FBUPv2.0.git|git|python,git"
    tools["FakeImageExploiter"]="FakeImageExploiter|null|https://github.com/r00t-3xp10it/FakeImageExploiter.git|git|git"
    tools["Findsploit"]="Findsploit|null|https://github.com/1N3/Findsploit.git|git|git"
    tools["Gemail-Hack"]="Gemail-Hack|null|https://github.com/Ha3MrX/Gemail-Hack.git|git|python,git"
    tools["Gloom-Framework"]="Gloom-Framework|null|https://github.com/StreetSec/Gloom-Framework.git|git|python,git"
    tools["GoblinWordGenerator"]="GoblinWordGenerator|null|https://github.com/UndeadSec/GoblinWordGenerator.git|git|python,git"
    tools["GoldenEye"]="GoldenEye|stress_testing|https://github.com/jseidl/GoldenEye.git|git|python,git"
    tools["HT-WPS-Breaker"]="HT-WPS-Breaker|null|https://github.com/SilentGhostX/HT-WPS-Breaker.git|git|git"
    tools["HTools"]="HTools|null|https://github.com/mehedishakeel/HTools.git|git|git"
    tools["Hash-Buster"]="Hash-Buster|password_attack|https://github.com/UltimateHackers/Hash-Buster.git|git|python,git"
    tools["Hatch"]="Hatch|null|https://github.com/MetaChar/Hatch.git|git|python,git"
    tools["HiddenEye"]="HiddenEye|null|https://github.com/DarkSecDevelopers/HiddenEye.git|git|python,git"
    tools["Hunner"]="Hunner|null|https://github.com/b3-v3r/Hunner.git|git|python,git"
    tools["IP-FY"]="IP-FY|information_gathering,ip_tracking|https://github.com/T4P4N/IP-FY.git|git|python,git"
    tools["IP-Locator"]="IP-Locator|null|https://github.com/zanyarjamal/IP-Locator.git|git|perl,git"
    tools["IP-Tracer"]="IP-Tracer|information_gathering,ip_tracking|https://github.com/Rajkumrdusad/IP-Tracer|git|php,git"
    tools["IPGeoLocation"]="IPGeoLocation|ip_tracking|https://github.com/maldevel/IPGeoLocation.git|git|python,git"
    tools["InSpy"]="InSpy|information_gathering|https://github.com/leapsecurity/InSpy.git|git|python,git"
    tools["Infoga"]="Infoga|information_gathering|https://github.com/m4ll0k/Infoga.git|git|python,git"
    tools["Instahack"]="Instahack|null|https://github.com/avramit/Instahack.git|git|python,git"
    tools["Intersect-2.5"]="Intersect-2.5|maintaining_access|https://github.com/deadbits/Intersect-2.5.git|git|python,git"
    tools["JohnTheRipper"]="JohnTheRipper|password_attack|https://github.com/magnumripper/JohnTheRipper.git|git|clang,gcc,g++,git"
    tools["KatanaFramework"]="KatanaFramework|null|https://github.com/PowerScript/KatanaFramework.git|git|python,git"
    tools["KnockMail"]="KnockMail|sniffing_spoofing|https://github.com/4w4k3/KnockMail.git|git|python,git"
    tools["LALIN"]="LALIN|null|https://github.com/Screetsec/LALIN.git|git|git"
    tools["LFISuite"]="LFISuite|null|https://github.com/D35m0nd142/LFISuite.git|git|python,git"
    tools["LITEDDOS"]="LITEDDOS|ddos|https://github.com/4L13199/LITEDDOS.git|git|python,git"
    tools["LITESPAM"]="LITESPAM|null|https://github.com/4L13199/LITESPAM.git|git|php,git"
    tools["Lazymux"]="Lazymux|null|https://github.com/Gameye98/Lazymux.git|git|python,git"
    tools["Leaked"]="Leaked|null|https://github.com/GitHackTools/Leaked.git|git|python,git"
    tools["Mercury"]="Mercury|null|https://github.com/MetaChar/Mercury.git|git|python,git"
    tools["Meterpreter_Paranoid_Mode-SSL"]="Meterpreter_Paranoid_Mode-SSL|exploitation_tools|https://github.com/r00t-3xp10it/Meterpreter_Paranoid_Mode-SSL.git|git|git"
    tools["MyServer"]="MyServer|web_server|https://github.com/Rajkumrdusad/MyServer.git|git|python,git"
    tools["Nethunter-In-Termux"]="Nethunter-In-Termux|null|https://github.com/Hax4us/Nethunter-In-Termux.git|git|git"
    tools["OSIF"]="OSIF|information_gathering|https://github.com/ciku370/OSIF.git|git|python,git"
    tools["PadBuster"]="PadBuster|web_hacking|https://github.com/AonCyberLabs/PadBuster.git|git|perl,git"
    tools["Parat"]="Parat|null|https://github.com/micle-fm/Parat.git|git|python,git"
    tools["Parsero"]="Parsero|information_gathering|https://github.com/behindthefirewalls/Parsero.git|git|python,git"
    tools["PiDense"]="PiDense|null|https://github.com/WiPi-Hunter/PiDense.git|git|python,git"
    tools["Planetwork-DDOS"]="Planetwork-DDOS|ddos,stress_testing|https://github.com/Hydra7/Planetwork-DDOS.git|git|python,git"
    tools["PowerSploit"]="PowerSploit|maintaining_access|https://github.com/PowerShellMafia/PowerSploit.git|git|git"
    tools["PwnSTAR"]="PwnSTAR|null|https://github.com/SilverFoxx/PwnSTAR.git|git|python,git"
    tools["PyBozoCrack"]="PyBozoCrack|null|https://github.com/ikkebr/PyBozoCrack.git|git|python,git"
    tools["Pybelt"]="Pybelt|null|https://github.com/Ekultek/Pybelt.git|git|python,git"
    tools["Pyrit"]="Pyrit|wireless_testing|https://github.com/JPaulMora/Pyrit.git|git|python,clang,gcc,git"
    tools["QRLJacking"]="QRLJacking|null|https://github.com/OWASP/QRLJacking.git|git|python,git"
    tools["RED_HAWK"]="RED_HAWK|information_gathering,vulnerability_scanner|https://github.com/Tuhinshubhra/RED_HAWK.git|git|php,git"
    tools["RTLSDR-Scanner"]="RTLSDR-Scanner|wireless_testing|https://github.com/EarToEarOak/RTLSDR-Scanner.git|git|python,git"
    tools["ReconDog"]="ReconDog|information_gathering|https://github.com/UltimateHackers/ReconDog.git|git|python,git"
    tools["RegRipper2.8"]="RegRipper2.8|forensics_tools|https://github.com/keydet89/RegRipper2.8.git|git|perl,git"
    tools["Remot3d"]="Remot3d|null|https://github.com/KeepWannabe/Remot3d.git|git|git"
    tools["Responder"]="Responder|sniffing_spoofing|https://github.com/lgandx/Responder.git|git|python,git"
    tools["ReverseAPK"]="ReverseAPK|null|https://github.com/1N3/ReverseAPK.git|git|git"
    tools["SCANNER-INURLBR"]="SCANNER-INURLBR|web_hacking|https://github.com/googleinurl/SCANNER-INURLBR.git|git|php,git"
    tools["SET"]="social-engineer-toolkit|information_gathering,exploitation_tools,password_attack,sniffing_spoofing|https://github.com/trustedsec/social-engineer-toolkit.git|git|python,git"
    tools["SH33LL"]="SH33LL|vulnerability_scanner,web_hacking|https://github.com/LOoLzeC/SH33LL.git|git|python,git"
    tools["SMBrute"]="SMBrute|null|https://github.com/m4ll0k/SMBrute.git|git|python,git"
    tools["SecLists"]="SecLists|password_attack|https://github.com/danielmiessler/SecLists.git|git|php,perl,git"
    tools["Simple-Fuzzer"]="Simple-Fuzzer|vulnerability_scanner|https://github.com/orgcandman/Simple-Fuzzer.git|git|clang,gcc,git"
    tools["Sn1per"]="Sn1per|null|https://github.com/1N3/Sn1per.git|git|python,git"
    tools["SocialBox"]="SocialBox|sniffing_spoofing|https://github.com/TunisianEagles/SocialBox.git|git|git"
    tools["SocialFish"]="SocialFish|password_attack,sniffing_spoofing|https://github.com/UndeadSec/SocialFish.git|git|python,git"
    tools["Spammer-Email"]="Spammer-Email|sniffing_spoofing|https://github.com/p4kl0nc4t/Spammer-Email.git|git|python,git"
    tools["Spammer-Grab"]="Spammer-Grab|sniffing_spoofing|https://github.com/p4kl0nc4t/Spammer-Grab.git|git|python,git"
    tools["Stitch"]="Stitch|null|https://github.com/nathanlopez/Stitch.git|git|python,git"
    tools["Striker"]="Striker|vulnerability_scanner|https://github.com/s0md3v/Striker.git|git|python,git"
    tools["Sublist3r"]="Sublist3r|information_gathering|https://github.com/aboul3la/Sublist3r.git|git|python,git"
    tools["TermuxAlpine"]="TermuxAlpine|termux_os|https://github.com/Hax4us/TermuxAlpine.git|git|proot,git"
    tools["Th3inspector"]="Th3inspector|null|https://github.com/Moham3dRiahi/Th3inspector.git|git|perl,git"
    tools["The-Eye"]="The-Eye|null|https://github.com/EgeBalci/The-Eye.git|git|golang,git"
    tools["TheFatRat"]="TheFatRat|null|https://github.com/Screetsec/TheFatRat.git|git|git"
    tools["Tool-X"]="Tool-X|null|https://github.com/Rajkumrdusad/Tool-X.git|git|python,git"
    tools["TorStat"]="TorStat|null|https://github.com/s0cket7/TorStat.git|git|python,git"
    tools["Trity"]="Trity|null|https://github.com/toxic-ig/Trity.git|git|python,git"
    tools["Umbrella"]="Umbrella|null|https://github.com/4w4k3/Umbrella.git|git|git"
    tools["Vegile"]="Vegile|null|https://github.com/Screetsec/Vegile.git|git|git"
    tools["WAScan"]="WAScan|information_gathering,vulnerability_scanner,web_hacking|https://github.com/m4ll0k/WAScan.git|git|python,git"
    tools["WP-plugin-scanner"]="WP-plugin-scanner|web_hacking|https://github.com/mintobit/WP-plugin-scanner.git|git|python,git"
    tools["WPSeku"]="WPSeku|null|https://github.com/m4ll0k/WPSeku.git|git|python,git"
    tools["WebScarab"]="OWASP-WebScarab|web_hacking|https://github.com/OWASP/OWASP-WebScarab.git|git|git"
    tools["WebXploiter"]="WebXploiter|web_hacking,exploitation_tools|https://github.com/a0xnirudh/WebXploiter.git|git|python,git"
    tools["WhatWeb"]="WhatWeb|web_hacking|https://github.com/urbanadventurer/WhatWeb.git|git|python,git"
    tools["WiFi-Pumpkin"]="WiFi-Pumpkin|wireless_testing|https://github.com/P0cL4bs/WiFi-Pumpkin.git|git|python,git"
    tools["WifiBruteCrack"]="WifiBruteCrack|wireless_testing|https://github.com/cinquemb/WifiBruteCrack.git|git|python,git"
    tools["Winpayloads"]="Winpayloads|null|https://github.com/nccgroup/Winpayloads.git|git|python,git"
    tools["XAttacker"]="XAttacker|vulnerability_scanner,web_hacking,exploitation_tools|https://github.com/Moham3dRiahi/XAttacker.git|git|perl,php,git"
    tools["XPL-SEARCH"]="XPL-SEARCH|web_hacking|https://github.com/r00tmars/XPL-SEARCH.git|git|php,git"
    tools["XSStrike"]="XSStrike|information_gathering,web_hacking|https://github.com/s0md3v/XSStrike.git|git|python,git"
    tools["Xshell"]="Xshell|vulnerability_scanner,web_hacking|https://github.com/Manisso/Xshell.git|git|git"
    tools["Zerodoor"]="Zerodoor|null|https://github.com/Souhardya/Zerodoor.git|git|python,git"
    tools["admin-panel-finder"]="admin-panel-finder|web_hacking|https://github.com/bdblackhat/admin-panel-finder.git|git|python,git"
    tools["air-hammer"]="air-hammer|null|https://github.com/Wh1t3Rh1n0/air-hammer.git|git|python,git"
    tools["aircrack-ng"]="aircrack-ng|wireless_testing|null|package_manager|null"
    tools["airgeddon"]="airgeddon|wireless_testing|https://github.com/v1s1t0r1sh3r3/airgeddon.git|git|git"
    tools["angryFuzzer"]="angryFuzzer|null|https://github.com/ihebski/angryFuzzer.git|git|python,git"
    tools["apache2"]="apache2|web_server,package|null|package_manager|null"
    tools["apt2"]="apt2|information_gathering|https://github.com/MooseDojo/apt2.git|git|python,git"
    tools["arch-linux"]="setupTermuxArch.sh|termux_os|https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh|curl|proot,curl"
    tools["arp-scan"]="arp-scan|information_gathering|https://github.com/royhills/arp-scan.git|git|clang,gcc,git"
    tools["avet"]="avet|null|https://github.com/govolution/avet.git|git|clang,gcc,git"
    tools["bbqsql"]="bbqsql|vulnerability_scanner|https://github.com/Neohapsis/bbqsql.git|git|python,git"
    tools["bed"]="bed|vulnerability_scanner|https://gitlab.com/kalilinux/packages/bed.git|git|perl,git"
    tools["beef"]="beef|exploitation_tools|https://github.com/beefproject/beef.git|git|ruby,git"
    tools["bettercap"]="bettercap|sniffing_spoofing|https://github.com/bettercap/bettercap.git|git|golang,git"
    tools["bing-ip2hosts"]="bing-ip2hosts|information_gathering|https://github.com/urbanadventurer/bing-ip2hosts.git|git|git"
    tools["binwalk"]="binwalk|forensics_tools|https://github.com/ReFirmLabs/binwalk.git|git|python,git"
    tools["blackbox"]="blackbox|vulnerability_scanner,exploitation_tools|https://github.com/jothatron/blackbox.git|git|python,git"
    tools["bleachbit"]="bleachbit|null|https://github.com/bleachbit/bleachbit.git|git|python,git"
    tools["braa"]="braa|information_gathering|https://github.com/mteg/braa.git|git|clang,gcc,git"
    tools["brutespray"]="brutespray|null|https://github.com/x90skysn3k/brutespray.git|git|python,git"
    tools["bulk_extractor"]="bulk_extractor|forensics_tools|https://github.com/simsong/bulk_extractor.git|git|clang,gcc,g++,git"
    tools["c++"]="gpp|programming_language|null|package_manager|null"
    tools["capstone"]="capstone|forensics_tools|https://github.com/aquynh/capstone.git|git|clang,gcc,python,git"
    tools["catphish"]="catphish|null|https://github.com/ring0lab/catphish.git|git|ruby,git"
    tools["cdpsnarf"]="cdpsnarf|information_gathering|https://github.com/Zapotek/cdpsnarf.git|git|clang,gcc,git"
    tools["clang"]="clang|programming_language|null|package_manager|null"
    tools["commix"]="commix|exploitation_tools,web_hacking|https://github.com/commixproject/commix.git|git|python,git"
    tools["cowpatty"]="cowpatty|wireless_testing|https://github.com/joswr1ght/cowpatty.git|git|clang,gcc,git"
    tools["cpscan"]="cpscan|null|https://github.com/susmithHCK/cpscan.git|git|python,git"
    tools["crackle"]="crackle|exploitation_tools,wireless_testing|https://github.com/mikeryan/crackle.git|git|clang,gcc,perl,git"
    tools["creddump"]="creddump|password_attack|https://github.com/moyix/creddump.git|git|python,git"
    tools["credmap"]="credmap|null|https://github.com/lightos/credmap.git|git|python,git"
    tools["crowbar"]="crowbar|password_attack|https://github.com/galkan/crowbar.git|git|python,git"
    tools["cuckoo"]="cuckoo|forensics_tools|https://github.com/cuckoosandbox/cuckoo.git|git|python,git"
    tools["cupp"]="cupp|password_attack|https://github.com/Mebus/cupp.git|git|python,git"
    tools["curl"]="curl|package|null|package_manager|null"
    tools["c"]="clang|programming_language|null|package_manager|null"
    tools["dbd"]="dbd|maintaining_access|https://github.com/gitdurandal/dbd.git|git|clang,gcc,git"
    tools["deblaze"]="deblaze|web_hacking|https://github.com/SpiderLabs/deblaze.git|git|clang,gcc,python,git"
    tools["dedsploit"]="dedsploit|null|https://github.com/ex0dus-0x/dedsploit.git|git|python,git"
    tools["demiguise"]="demiguise|null|https://github.com/nccgroup/demiguise.git|git|python,git"
    tools["distorm"]="distorm|forensics_tools|https://github.com/gdabah/distorm.git|git|clang,gcc,python,git"
    tools["djangohunter"]="djangohunter|null|https://github.com/6IX7ine/djangohunter.git|git|python,git"
    tools["dmitry"]="dmitry|information_gathering|https://github.com/jaygreig86/dmitry.git|git|clang,gcc,git"
    tools["dnschef"]="dnschef|sniffing_spoofing|https://gitlab.com/kalilinux/packages/dnschef.git|git|python,git"
    tools["dnsenum"]="dnsenum|information_gathering|https://github.com/fwaeytens/dnsenum.git|git|perl,git"
    tools["dnsmap"]="dnsmap|information_gathering|https://github.com/makefu/dnsmap.git|git|clang,gcc,git"
    tools["dnsrecon"]="dnsrecon|information_gathering|https://github.com/darkoperator/dnsrecon.git|git|python,ruby,git"
    tools["doona"]="doona|vulnerability_scanner|https://github.com/wireghoul/doona.git|git|perl,git"
    tools["doork"]="doork|information_gathering,web_hacking|https://github.com/AeonDave/doork.git|git|python,git"
    tools["dotdotpwn"]="dotdotpwn|information_gathering,vulnerability_scanner|https://github.com/wireghoul/dotdotpwn.git|git|perl,git"
    tools["dumpzilla"]="dumpzilla|forensics_tools|https://gitlab.com/kalilinux/packages/dumpzilla.git|git|python,git"
    tools["eaphammer"]="eaphammer|null|https://github.com/s0lst1c3/eaphammer.git|git|python,git"
    tools["elpscrk"]="elpscrk|null|https://github.com/D4Vinci/elpscrk.git|git|python,git"
    tools["enum4linux"]="enum4linux|information_gathering|https://github.com/portcullislabs/enum4linux.git|git|perl,git"
    tools["eternal_scanner"]="eternal_scanner|null|https://github.com/peterpt/eternal_scanner.git|git|python,git"
    tools["evilginx"]="evilginx|null|https://github.com/kgretzky/evilginx.git|git|python,git"
    tools["exploitdb"]="exploitdb|exploitation_tools|https://github.com/offensive-security/exploitdb.git|git|clang,gcc,python,git"
    tools["extundelete"]="extundelete|forensics_tools|https://gitlab.com/kalilinux/packages/extundelete.git|git|clang,gcc,g++,python,git"
    tools["ezsploit"]="ezsploit|null|https://github.com/rand0m1ze/ezsploit.git|git|git"
    tools["faraday"]="faraday|information_gathering|https://github.com/infobyte/faraday.git|git|python,git"
    tools["fbht"]="fbht|null|https://github.com/chinoogawa/fbht.git|git|python,git"
    tools["fbvid"]="fbvid|null|https://github.com/Tuhinshubhra/fbvid.git|git|php,git"
    tools["fern-wifi-cracker"]="fern-wifi-cracker|wireless_testing|https://github.com/savio-code/fern-wifi-cracker.git|git|python,git"
    tools["fierce"]="fierce|information_gathering|https://github.com/mschwager/fierce.git|git|python,git"
    tools["figlet"]="figlet|package|null|package_manager|null"
    tools["findmyhash"]="findmyhash|password_attack|https://gitlab.com/kalilinux/packages/findmyhash.git|git|python,git"
    tools["firewalk"]="firewalk|information_gathering|https://gitlab.com/kalilinux/packages/firewalk.git|git|clang,gcc,git"
    tools["fluxion"]="fluxion|wireless_testing|https://github.com/FluxionNetwork/fluxion.git|git|git"
    tools["foremost"]="foremost|forensics_tools|https://gitlab.com/kalilinux/packages/foremost.git|git|clang,gcc,git"
    tools["fragrouter"]="fragrouter|information_gathering|https://gitlab.com/kalilinux/packages/fragrouter.git|git|clang,gcc,git"
    tools["fragroute"]="fragroute|information_gathering|https://gitlab.com/kalilinux/packages/fragroute.git|git|clang,gcc,git"
    tools["fsociety"]="fsociety|null|https://github.com/Manisso/fsociety.git|git|python,git"
    tools["fuckshitup"]="fuckshitup|null|https://github.com/Smaash/fuckshitup.git|git|php,git"
    tools["fuxploider"]="fuxploider|null|https://github.com/almandin/fuxploider.git|git|python,git"
    tools["gasmask"]="gasmask|null|https://github.com/twelvesec/gasmask.git|git|python,git"
    tools["gcat"]="gcat|null|https://github.com/byt3bl33d3r/gcat.git|git|python,git"
    tools["get"]="get|null|https://github.com/peterpt/get.git|git|git"
    tools["ghost-phisher"]="ghost-phisher|information_gathering|https://github.com/savio-code/ghost-phisher.git|git|python,git"
    tools["giskismet"]="giskismet|wireless_testing|https://github.com/xtr4nge/giskismet.git|git|perl,git"
    tools["git"]="git|package|null|package_manager|null"
    tools["gobuster"]="gobuster|web_hacking|https://github.com/OJ/gobuster.git|git|golang,git"
    tools["golang"]="golang|programming_language|null|package_manager|null"
    tools["golismero"]="golismero|information_gathering|https://github.com/golismero/golismero.git|git|python,git"
    tools["goofile"]="goofile|information_gathering|https://gitlab.com/kalilinux/packages/goofile.git|git|python,git"
    tools["gcc"]="gcc|programming_language|null|package_manager|null"
    tools["hURL"]="hURL|web_hacking|https://github.com/fnord0/hURL.git|git|perl,git"
    tools["hacktronian"]="hacktronian|null|https://github.com/thehackingsage/hacktronian.git|git|git"
    tools["hakkuframework"]="hakkuframework|null|https://github.com/4shadoww/hakkuframework.git|git|python,git"
    tools["hammer"]="hammer|ddos|https://github.com/cyweb/hammer.git|git|python,git"
    tools["hash-generator"]="hash-generator|password_attack|https://github.com/CiKu370/hash-generator.git|git|python,git"
    tools["hashcat"]="hashcat|password_attack|https://github.com/hashcat/hashcat.git|git|clang,gcc,git"
    tools["hasherdotid"]="hasherdotid|password_attack|https://github.com/galauerscrew/hasherdotid.git|git|python,git"
    tools["hasher"]="hasher|password_attack|https://github.com/CiKu370/hasher.git|git|python,git"
    tools["httptunnel"]="httptunnel|maintaining_access|https://github.com/larsbrinkhoff/httptunnel.git|git|clang,gcc,git"
    tools["hulk"]="hulk|ddos|https://github.com/grafov/hulk.git|git|python,git"
    tools["hydra"]="hydra|stress_testing,password_attack|null|package_manager|null"
    tools["iSMTP"]="ipwn|information_gathering|https://github.com/altjx/ipwn.git|git|python,git"
    tools["intrace"]="intrace|information_gathering|https://github.com/robertswiecki/intrace.git|git|clang,gcc,git"
    tools["jboss-autopwn"]="jboss-autopwn|null|https://github.com/SpiderLabs/jboss-autopwn.git|git|git"
    tools["johnny"]="johnny|password_attack|https://github.com/shinnok/johnny.git|git|clang,gcc,g++,git"
    tools["joomscan"]="joomscan|web_hacking|https://github.com/rezasp/joomscan.git|git|perl,git"
    tools["jsql-injection"]="jsql-injection|vulnerability_scanner|https://github.com/ron190/jsql-injection.git|git|php,git"
    tools["kalibrate-rtl"]="kalibrate-rtl|wireless_testing|https://github.com/steve-m/kalibrate-rtl.git|git|clang,gcc,g++,git"
    tools["keimpx"]="keimpx|password_attack|https://github.com/inquisb/keimpx.git|git|python,git"
    tools["kickthemout"]="kickthemout|wireless_testing|https://github.com/k4m4/kickthemout.git|git|python,git"
    tools["killchain"]="killchain|null|https://github.com/ruped24/killchain.git|git|python,git"
    tools["killerbee"]="killerbee|wireless_testing|https://github.com/riverloopsec/killerbee.git|git|python,clang,gcc,g++,git"
    tools["killshot"]="killshot|null|https://github.com/bahaabdelwahed/killshot.git|git|ruby,git"
    tools["koadic"]="koadic|null|https://github.com/zerosum0x0/koadic.git|git|python,git"
    tools["kwetza"]="kwetza|null|https://github.com/sensepost/kwetza.git|git|python,git"
    tools["leviathan"]="leviathan|null|https://github.com/tearsecurity/leviathan.git|git|python,git"
    tools["lscript"]="lscript|null|https://github.com/arismelachroinos/lscript.git|git|git"
    tools["lynis"]="lynis|vulnerability_scanner|https://github.com/CISOfy/lynis.git|git|git"
    tools["maskprocessor"]="maskprocessor|password_attack|https://github.com/hashcat/maskprocessor.git|git|clang,gcc,git"
    tools["masscan"]="masscan|information_gathering|https://github.com/robertdavidgraham/masscan.git|git|clang,gcc,git"
    tools["metasploit-framework"]="msfinstall|exploitation_tools|https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb|curl|curl"
    tools["mfcuk"]="mfcuk|wireless_testing|https://github.com/nfc-tools/mfcuk.git|git|clang,gcc,git"
    tools["mfoc"]="mfoc|wireless_testing|https://github.com/nfc-tools/mfoc.git|git|clang,gcc,git"
    tools["mfterm"]="mfterm|wireless_testing|https://github.com/4ZM/mfterm.git|git|clang,gcc,git"
    tools["mitmproxy"]="mitmproxy|sniffing_spoofing|https://github.com/mitmproxy/mitmproxy.git|git|python,git"
    tools["morpheus"]="morpheus|null|https://github.com/r00t-3xp10it/morpheus.git|git|python,git"
    tools["msfpc"]="msfpc|exploitation_tools|https://github.com/g0tmi1k/msfpc.git|git|git"
    tools["multimon-ng"]="multimon-ng|wireless_testing|https://github.com/EliasOenal/multimon-ng.git|git|python,clang,gcc,git"
    tools["nWatch"]="nWatch|null|https://github.com/s0cket7/nWatch.git|git|python,git"
    tools["nano"]="nano|package|null|package_manager|null"
    tools["netattack2"]="netattack2|wireless_testing|https://github.com/chrizator/netattack2.git|git|python,git"
    tools["netattack"]="netattack|wireless_testing|https://github.com/chrizator/netattack.git|git|python,git"
    tools["netdiscover"]="netdiscover|null|https://github.com/alexxy/netdiscover.git|git|git"
    tools["nginx"]="nginx|web_server,package|null|package_manager|null"
    tools["nikto"]="nikto|information_gathering|https://github.com/sullo/nikto.git|git|perl,git"
    tools["nishang"]="nishang|maintaining_access|https://github.com/samratashok/nishang.git|git|git"
    tools["nmap"]="nmap|information_gathering,vulnerability_scanner|null|package_manager|null"
    tools["nodejs"]="nodejs|programming_language|null|package_manager|null"
    tools["nodexp"]="nodexp|null|https://github.com/esmog/nodexp.git|git|python,git"
    tools["noisy"]="noisy|null|https://github.com/1tayH/noisy.git|git|python,git"
    tools["onioff"]="onioff|null|https://github.com/k4m4/onioff.git|git|python,git"
    tools["openvas"]="openvas|vulnerability_scanner|https://github.com/greenbone/openvas.git|git|clang,gcc,git"
    tools["osrframework"]="osrframework|information_gathering|https://github.com/i3visio/osrframework.git|git|python,git"
    tools["p0f"]="p0f|forensics_tools|https://gitlab.com/kalilinux/packages/p0f.git|git|clang,gcc,g++,git"
    tools["patator"]="patator|password_attack|https://gitlab.com/kalilinux/packages/patator.git|git|python,git"
    tools["pdf-parser"]="pdf-parser|forensics_tools|https://gitlab.com/kalilinux/packages/pdf-parser.git|git|python,git"
    tools["peepdf"]="peepdf|null|https://github.com/jesparza/peepdf.git|git|python,git"
    tools["perl"]="perl|programming_language|null|package_manager|null"
    tools["php"]="php|programming_language|null|package_manager|null"
    tools["pixiewps"]="pixiewps|wireless_testing|https://github.com/wiire-a/pixiewps.git|git|clang,gcc,git"
    tools["plecost"]="plecost|web_hacking|https://github.com/iniqua/plecost.git|git|python,git"
    tools["powerfuzzer"]="powerfuzzer|vulnerability_scanner|https://gitlab.com/marcinguy/powerfuzzer.git|git|python,git"
    tools["proxystrike"]="proxystrike|web_hacking|https://github.com/qunxyz/proxystrike.git|git|python,git"
    tools["pupy"]="pupy|null|https://github.com/n1nj4sec/pupy|git|python,git"
    tools["pwnat"]="pwnat|maintaining_access|https://github.com/samyk/pwnat.git|git|clang,gcc,git"
    tools["pyPISHER"]="pyPISHER|sniffing_spoofing|https://github.com/Renato-Silva/pyPISHER.git|git|python,git"
    tools["pybluez"]="pybluez|null|https://github.com/karulis/pybluez.git|git|python,git"
    tools["pydictor"]="pydictor|null|https://github.com/LandGrey/pydictor.git|git|python,git"
    tools["python"]="python|programming_language|null|package_manager|null"
    tools["qark"]="qark|null|https://github.com/linkedin/qark.git|git|python,git"
    tools["rang3r"]="rang3r|vulnerability_scanner|https://github.com/floriankunushevci/rang3r.git|git|python,git"
    tools["rdpy"]="rdpy|null|https://github.com/citronneur/rdpy.git|git|python,git"
    tools["reaver"]="reaver-wps-fork-t6x|wireless_testing|https://github.com/t6x/reaver-wps-fork-t6x.git|git|clang,gcc,git"
    tools["recon-ng"]="recon-ng|information_gathering|https://github.com/lanmaster53/recon-ng.git|git|python,git"
    tools["ridenum"]="ridenum|maintaining_access|https://github.com/trustedsec/ridenum.git|git|python,git"
    tools["routersploit"]="routersploit|vulnerability_scanner,exploitation_tools|https://github.com/reverse-shell/routersploit.git|git|python,git"
    tools["roxysploit"]="roxysploit|exploitation_tools|https://github.com/andyvaikunth/roxysploit.git|git|python,git"
    tools["ruby"]="ruby|programming_language|null|package_manager|null"
    tools["sAINT"]="sAINT|null|https://github.com/tiagorlampert/sAINT.git|git|git"
    tools["santet-online"]="santet-online|stress_testing,sniffing_spoofing|https://github.com/Gameye98/santet-online.git|git|python,git"
    tools["secHub"]="secHub|null|https://github.com/cys3c/secHub.git|git|python,git"
    tools["shellnoob"]="shellnoob|exploitation_tools|https://github.com/reyammer/shellnoob.git|git|python,git"
    tools["shellstack"]="shellstack|null|https://github.com/Tuhinshubhra/shellstack.git|git|php,git"
    tools["shimit"]="shimit|null|https://github.com/cyberark/shimit.git|git|python,git"
    tools["shodanwave"]="shodanwave|null|https://github.com/6IX7ine/shodanwave.git|git|python,git"
    tools["sipvicious"]="sipvicious|sniffing_spoofing|https://github.com/EnableSecurity/sipvicious.git|git|python,git"
    tools["skipfish"]="skipfish|web_hacking|https://gitlab.com/kalilinux/packages/skipfish.git|git|clang,gcc,git"
    tools["slowhttptest"]="slowhttptest|stress_testing|https://github.com/shekyan/slowhttptest.git|git|clang,gcc,g++,git"
    tools["slowloris"]="slowloris|ddos,stress_testing|https://github.com/gkbrk/slowloris.git|git|python,git"
    tools["smap"]="smap|web_hacking|https://github.com/s0cket7/smap|git|python,git"
    tools["smbmap"]="smbmap|information_gathering|https://github.com/ShawnDEvans/smbmap.git|git|python,git"
    tools["sniffjoke"]="sniffjoke|sniffing_spoofing|https://github.com/vecna/sniffjoke.git|git|clang,gcc,g++,git"
    tools["social-engineer-toolkit"]="social-engineer-toolkit|information_gathering,exploitation_tools,password_attack,sniffing_spoofing|https://github.com/trustedsec/social-engineer-toolkit.git|git|python,git"
    tools["sqliv"]="sqliv|vulnerability_scanner,web_hacking|https://github.com/Hadesy2k/sqliv.git|git|python,git"
    tools["sqlmap"]="sqlmap|information_gathering,vulnerability_scanner,exploitation_tools,web_hacking|https://github.com/sqlmapproject/sqlmap|git|python,git"
    tools["sqlmate"]="sqlmate|information_gathering,vulnerability_scanner,web_hacking|https://github.com/s0md3v/sqlmate.git|git|python,git"
    tools["sqlscan"]="sqlscan|information_gathering,vulnerability_scanner,web_hacking|https://github.com/Cvar1984/sqlscan.git|git|php,git"
    tools["sslcaudit"]="sslcaudit|information_gathering|https://github.com/abbbe/sslcaudit.git|git|clang,gcc,git"
    tools["sslsplit"]="sslsplit|information_gathering|https://github.com/droe/sslsplit.git|git|clang,gcc,git"
    tools["sslstrip"]="sslstrip|information_gathering,sniffing_spoofing|https://github.com/moxie0/sslstrip.git|git|python,git"
    tools["sslyze"]="sslyze|information_gathering|https://github.com/iSECPartners/sslyze.git|git|python,git"
    tools["subscraper"]="subscraper|null|https://github.com/m8r0wn/subscraper.git|git|python,git"
    tools["termineter"]="termineter|stress_testing|https://github.com/securestate/termineter.git|git|python,git"
    tools["termux-fedora"]="termux-fedora|termux_os|https://github.com/nmilosev/termux-fedora.git|git|proot,git"
    tools["termux-lazysqlmap"]="termux-lazysqlmap|null|https://github.com/verluchie/termux-lazysqlmap.git|git|git"
    tools["termux-ubuntu"]="termux-ubuntu|termux_os|https://github.com/Neo-Oli/termux-ubuntu.git|git|proot,git"
    tools["thc-ipv6"]="thc-ipv6|information_gathering,vulnerability_scanner,exploitation_tools|https://github.com/vanhauser-thc/thc-ipv6.git|git|clang,gcc,git"
    tools["the-backdoor-factory"]="the-backdoor-factory|exploitation_tools|https://github.com/secretsquirrel/the-backdoor-factory.git|git|python,git"
    tools["theHarvester"]="theHarvester|information_gathering|https://github.com/laramies/theHarvester.git|git|python,git"
    tools["toilet"]="toilet|package|null|package_manager|null"
    tools["torghost"]="torghost|null|https://github.com/susmithHCK/torghost.git|git|python,git"
    tools["torshammer"]="torshammer|stress_testing|https://github.com/dotfighter/torshammer.git|git|python,git"
    tools["tor"]="tor|package|null|package_manager|null"
    tools["trackout"]="trackout|information_gathering,ip_tracking|https://github.com/abaykan/trackout.git|git|python,git"
    tools["trape"]="trape|ip_tracking|https://github.com/boxug/trape.git|git|python,git"
    tools["trojanizer"]="trojanizer|null|https://github.com/r00t-3xp10it/trojanizer.git|git|git"
    tools["txtool"]="txtool|exploitation_tools|https://github.com/kuburan/txtool.git|git|python,git"
    tools["uidsploit"]="uidsploit|null|https://github.com/siruidops/uidsploit.git|git|git"
    tools["volatility"]="volatility|forensics_tools|https://github.com/volatilityfoundation/volatility.git|git|python,git"
    tools["w3af"]="w3af|web_hacking|https://github.com/andresriancho/w3af.git|git|python,git"
    tools["w3m"]="w3m|package|null|package_manager|null"
    tools["wafw00f"]="wafw00f|null|https://github.com/EnableSecurity/wafw00f.git|git|python,git"
    tools["webdav"]="webdav|web_hacking|https://github.com/hacdias/webdav.git|git|golang,git"
    tools["webpwn3r"]="webpwn3r|null|https://github.com/zigoo0/webpwn3r.git|git|python,git"
    tools["websploit"]="websploit|web_hacking,exploitation_tools|https://github.com/websploit/websploit.git|git|python,git"
    tools["weeman"]="weeman|null|https://github.com/evait-security/weeman.git|git|python,git"
    tools["weevely3"]="weevely3|null|https://github.com/epinna/weevely3.git|git|python,git"
    tools["wfdroid-termux"]="wfdroid-termux|null|https://github.com/bytezcrew/wfdroid-termux.git|git|git"
    tools["wfuzz"]="wfuzz|web_hacking|https://github.com/xmendez/wfuzz.git|git|python,git"
    tools["wget"]="wget|package|null|package_manager|null"
    tools["wifi-hacker"]="wifi-hacker|wireless_testing|https://github.com/esc0rtd3w/wifi-hacker.git|git|git"
    tools["WifiGod"]="WifiGod|wireless_testing|https://github.com/waseem-sajjad/WifiGod.git|git|python,git"
    tools["wifiphisher"]="wifiphisher|wireless_testing|https://github.com/wifiphisher/wifiphisher.git|git|python,git"
    tools["wifitap"]="wifitap|wireless_testing|https://github.com/GDSSecurity/wifitap.git|git|python,git"
    tools["wifite2"]="wifite2|wireless_testing|https://github.com/derv82/wifite2.git|git|python,git"
    tools["wifite"]="wifite|wireless_testing|https://github.com/derv82/wifite.git|git|python,git"
    tools["wifresti"]="wifresti|wireless_testing|https://github.com/LionSec/wifresti.git|git|python,git"
    tools["wirespy"]="wirespy|wireless_testing|https://github.com/AresS31/wirespy.git|git|git"
    tools["wpscan"]="wpscan|information_gathering,vulnerability_scanner,web_hacking|https://github.com/wpscanteam/wpscan.git|git|ruby,git"
    tools["wreckuests"]="wreckuests|null|https://github.com/JamesJGoodwin/wreckuests.git|git|python,git"
    tools["xerosploit"]="xerosploit|exploitation_tools|https://github.com/LionSec/xerosploit.git|git|python,git"
    tools["xplico"]="xplico|forensics_tools|https://gitlab.com/kalilinux/packages/xplico.git|git|clang,gcc,php,git"
    tools["xspy"]="xspy|sniffing_spoofing|https://github.com/mnp/xspy.git|git|clang,gcc,git"
    tools["xsser"]="xsser|web_hacking|https://github.com/epsylon/xsser.git|git|python,git"
    tools["yersinia"]="yersinia|vulnerability_scanner,exploitation_tools|https://github.com/tomac/yersinia.git|git|clang,gcc,git"
    tools["zambie"]="zambie|null|https://github.com/zanyarjamal/zambie.git|git|python,git"
    tools["zaproxy"]="zaproxy|web_hacking|https://github.com/zaproxy/zaproxy.git|git|python,php,git"
    tools["zarp"]="zarp|null|https://github.com/hatRiot/zarp.git|git|python,git"
    tools["zip"]="zip|package|null|package_manager|null"
    tools["zirikatu"]="zirikatu|null|https://github.com/pasahitz/zirikatu.git|git|git"

    # Create sorted tool names array
    tool_names=($(printf '%s\n' "${!tools[@]}" | sort))
}

# Animation functions
animate_text() {
    local text="$1"
    local color="$2"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${color}${text:$i:1}${NC}"
        sleep $ANIMATION_SPEED
    done
    echo
}

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

progress_bar() {
    local duration=$1
    local steps=50
    local step_delay=$(echo "scale=3; $duration/$steps" | bc)
    
    printf "["
    for ((i=0; i<=steps; i++)); do
        printf "?"
        sleep $step_delay
    done
    printf "] Done!\n"
}

# Utility functions
check_dependencies() {
    local deps=$1
    IFS=',' read -ra dep_array <<< "$deps"
    
    for dep in "${dep_array[@]}"; do
        if ! command -v $dep &> /dev/null; then
            case $dep in
                "python"|"php"|"perl"|"ruby"|"golang"|"clang"|"gcc"|"g++"|"git"|"curl"|"proot")
                    echo -e "${YELLOW}Installing $dep...${NC}"
                    pkg install -y $dep 2>/dev/null || apt install -y $dep 2>/dev/null || yum install -y $dep 2>/dev/null
                    ;;
            esac
        fi
    done
}

install_tool() {
    local tool_name="$1"
    local tool_data="${tools[$tool_name]}"
    
    if [ -z "$tool_data" ]; then
        echo -e "${RED}Tool not found: $tool_name${NC}"
        return 1
    fi

    IFS='|' read -ra data <<< "$tool_data"
    local display_name="${data[0]}"
    local category="${data[1]}"
    local url="${data[2]}"
    local install_method="${data[3]}"
    local dependencies="${data[4]}"

    echo -e "\n${CYAN}Installing $display_name...${NC}"
    echo -e "${YELLOW}Category: $category${NC}"
    
    # Check and install dependencies
    if [ "$dependencies" != "null" ]; then
        echo -e "${BLUE}Checking dependencies...${NC}"
        check_dependencies "$dependencies"
    fi

    # Create tools directory
    mkdir -p ~/tools

    cd ~/tools

    # Install based on method
    case $install_method in
        "git")
            if [ "$url" != "null" ]; then
                echo -e "${GREEN}Cloning from $url...${NC}"
                git clone "$url" "$display_name" 2>/dev/null &
                spinner $!
                cd "$display_name"
                
                # Check for setup script
                if [ -f "setup.py" ]; then
                    echo -e "${BLUE}Running Python setup...${NC}"
                    pip install -r requirements.txt 2>/dev/null || true
                    python setup.py install 2>/dev/null &
                    spinner $!
                elif [ -f "requirements.txt" ]; then
                    echo -e "${BLUE}Installing Python requirements...${NC}"
                    pip install -r requirements.txt 2>/dev/null &
                    spinner $!
                elif [ -f "Makefile" ]; then
                    echo -e "${BLUE}Compiling with make...${NC}"
                    make 2>/dev/null &
                    spinner $!
                    make install 2>/dev/null &
                    spinner $!
                fi
            fi
            ;;
        "curl")
            if [ "$url" != "null" ]; then
                echo -e "${GREEN}Downloading with curl...${NC}"
                curl -O "$url" 2>/dev/null &
                spinner $!
                chmod +x "${url##*/}" 2>/dev/null || true
            fi
            ;;
        "package_manager")
            echo -e "${GREEN}Installing via package manager...${NC}"
            pkg install -y "$tool_name" 2>/dev/null || apt install -y "$tool_name" 2>/dev/null || yum install -y "$tool_name" 2>/dev/null &
            spinner $!
            ;;
    esac

    echo -e "${GREEN}? $display_name installed successfully!${NC}"
    cd ~
}

show_tools() {
    local page=$1
    local start=$(( (page - 1) * TOOLS_PER_PAGE ))
    local end=$(( start + TOOLS_PER_PAGE - 1 ))
    local total_tools=${#tool_names[@]}
    local total_pages=$(( (total_tools + TOOLS_PER_PAGE - 1) / TOOLS_PER_PAGE ))

    clear
    echo -e "${PURPLE}"
    echo "+---------------------------------------------------------------------+"
    echo "�                   F-SOCIETY TOOLKIT                                �"
    echo "� ███████╗    ███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗ �"
    echo "� ██╔════╝    ██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔  �"
    echo "� █████╗█████╗███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝  �"
    echo "� ██╔══╝╚════╝╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝   �"  
    echo "� ██║         ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║    �"
    echo "� ╚═╝         ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝    �"
    echo "�                    CREATED BY ATHEX                                �"
    echo "�                    Total Tools: $total_tools                       �"
    echo "+---------------------------------------------------------------------+"
    echo -e "${NC}"

    for ((i=start; i<=end && i<total_tools; i++)); do
        local tool_name="${tool_names[$i]}"
        local tool_data="${tools[$tool_name]}"
        IFS='|' read -ra data <<< "$tool_data"
        local display_name="${data[0]}"
        local category="${data[1]}"
        
        printf "${CYAN}%3d.${NC} ${GREEN}%-25s${NC} ${YELLOW}%-30s${NC} ${BLUE}%s${NC}\n" \
               $((i+1)) "$tool_name" "$display_name" "$category"
    done

    echo -e "\n${WHITE}Page $page of $total_pages${NC}"
    echo -e "${CYAN}Commands: [n] exit, [p] previous, [number] install, [s] search, [q] quit${NC}"
}

search_tools() {
    local query="$1"
    echo -e "\n${CYAN}Searching for: $query${NC}"
    echo
    
    local found=0
    for tool_name in "${tool_names[@]}"; do
        local tool_data="${tools[$tool_name]}"
        if [[ "$tool_name" == *"$query"* ]] || [[ "$tool_data" == *"$query"* ]]; then
            IFS='|' read -ra data <<< "$tool_data"
            local display_name="${data[0]}"
            local category="${data[1]}"
            
            printf "${CYAN}%-20s${NC} ${GREEN}%-25s${NC} ${YELLOW}%s${NC}\n" \
                   "$tool_name" "$display_name" "$category"
            ((found++))
        fi
    done
    
    if [ $found -eq 0 ]; then
        echo -e "${RED}No tools found matching: $query${NC}"
    else
        echo -e "\n${GREEN}Found $found tools${NC}"
    fi
}

# Main function
main() {
    initialize_tools
    
    local current_page=1
    local total_tools=${#tool_names[@]}
    local total_pages=$(( (total_tools + TOOLS_PER_PAGE - 1) / TOOLS_PER_PAGE ))
    
    while true; do
        show_tools $current_page
        
        echo -e "\n${WHITE}Enter your choice: ${NC}"
        read -p "> " choice
        
        case $choice in
            [0-9]*)
                if [ $choice -ge 1 ] && [ $choice -le $total_tools ]; then
                    local tool_index=$((choice - 1))
                    local selected_tool="${tool_names[$tool_index]}"
                    install_tool "$selected_tool"
                    echo -e "\n${YELLOW}Press Enter to continue...${NC}"
                    read
                else
                    echo -e "${RED}Invalid selection! Please choose between 1 and $total_tools${NC}"
                    sleep 2
                fi
                ;;
            "n"|"N")
                if [ $current_page -lt $total_pages ]; then
                    ((current_page++))
                else
                    echo -e "${RED}Already on the last page!${NC}"
                    sleep 1
                fi
                ;;
            "p"|"P")
                if [ $current_page -gt 1 ]; then
                    ((current_page--))
                else
                    echo -e "${RED}Already on the first page!${NC}"
                    sleep 1
                fi
                ;;
            "s"|"S")
                echo -e "${CYAN}Enter search term: ${NC}"
                read -p "> " search_term
                search_tools "$search_term"
                echo -e "\n${YELLOW}Press Enter to continue...${NC}"
                read
                ;;
            "q"|"Q")
                echo -e "${GREEN}Thanks for using Animated Bash Toolkit!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Banner display
show_banner() {
    clear
    echo -e "${PURPLE}"
    cat << "BANNER"
+----------------------------------------------------------------+
�                                                                �
�     █████╗ ████████╗██╗  ██╗███████╗██╗  ██╗                   �
�    ██╔══██╗╚══██╔══╝██║  ██║██╔════╝╚██╗██╔╝                   �
�    ███████║   ██║   ███████║█████╗   ╚███╔╝                    �
�    ██╔══██║   ██║   ██╔══██║██╔══╝   ██╔██╗                    �
�    ██║  ██║   ██║   ██║  ██║███████╗██╔╝ ██╗                   �
�    ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                   �
�                                                                �
�              A T H E X   T O O L K I T   v2.0                  �
�                  370+ Security Tools                           �
�                                                                �
+----------------------------------------------------------------+
BANNER
    echo -e "${NC}"
    
    animate_text "Initializing toolkit..." "$CYAN"
    progress_bar 2
    
    echo -e "\n${GREEN}Toolkit ready! Press Enter to continue...${NC}"
    read
}

# Start the script
show_banner
main
