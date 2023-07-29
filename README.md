# What is this?

My AwesomeWM Build with designs based on personal preferences aka. my ULTIMATE build !! <br/>
This is a unique design of window manager that will have 10 tags <br/>
with first 5 tags showing as page 1, another 5 tags showing as page 2

# Design

My Designs on Paper <br/>
Design of bar
![Design of bar](./.github/design.png)
Design of titlebar on file browser
![Design of titlebar](./.github/booklet.png)

Screenshot of Current Progress

![Current Progress](./.github/curr_progress.jpg)

# Usage

How to use my setup?<br />
<br />
DWM keybindings:<br />
I have set my Modkey to Windows Key! If you do prefer Alt Key, set Mod4Mask to Mod1Mask in dwm/config.def.h!<br />
Here are the default keybindings that I have customized to my likings:<br />
Switching tags:<br />
Modkey+1 - switch to tag 1<br />
Modkey+2 - switch to tag 2<br />
Modkey+3 - switch to tag 3<br />
Modkey+4 - switch to tag 4<br />
Modkey+5 - switch to tag 5<br />
Modkey+F1 - switch to tag 6<br />
Modkey+F2 - switch to tag 7<br />
Modkey+F3 - switch to tag 8<br />
Modkey+F4 - switch to tag 9<br />
Modkey+F5 - switch to tag 10<br />
Switch Focus between apps:<br />
Modkey+K - next app<br />
Modkey+J - previous app<br />
Modkey+Enter - move currently focus app to main stack(switching app order)<br />
Moving app between tags:<br />
focus on the app that u want to move,<br />
ModKey+Shift+1-F5 - move app to tag 1-10<br />
Launching app:<br />
Modkey+P - runs rofi launchpad, choose with arrow keys and enter to launch<br />
Launching terminal(st):<br />
Modkey+Shift+Enter - launch st terminal, u can change ur default terminal in dwm/config.def.h to kitty if you prefer!<br />
(one instance of empty st takes 4-6MB of RAM, one instance of empty kitty takes 40~60MB of RAM)<br />
<br />

fish shell config:<br />
<br />
Buttons:<br />
(TAB) - autocompletion<br />
(Right Arrow Key) - autocompletion by one character<br />
<br/>
Aliases:<br />
c - alias set to clear<br />
cmatrix - alias set to unimatrix with customization parameters<br />
btp - bluetoothctl power on<br />
btf - bluetoothctl power off<br />
bts - bluetoothctl scan on<br />
btc - bluetoothctl connect AC:12:12:12 (in this case my personal device, u can change it)<br />
icat - kitty +kitten icat <br />
yt - youtube-dl -o '$HOME/Downloads/%(title)s-%(id)s.%(ext)s' -f bestaudio (to install youtube music with best audio to Downloads/ directory) <br />
<br />
Abbr:<br />
p - sudo pacman <br />
y - yay <br />
Autostart:<br />
startx on tty1 upon login<br />
auto use fishbone omf theme on st & tty fish shell<br />
specifically only on vscode terminal, use agnoster omf theme on fish shell<br />

<br />
(Do feel free to change and modify them to your own likings!)

# Credits

Inspirations from: <br/>
edr3x - [https://github.com/edr3x/.dotfiles](https://github.com/edr3x/.dotfiles) <br/>
rklyz - [https://github.com/rklyz/MyRice](https://github.com/rklyz/MyRice) <br/>

Huge shoutout to them <3

Libraries Used: <br/>
Bling - [https://github.com/BlingCorp/bling.git](https://github.com/BlingCorp/bling.git) <br/>
Rubato - [https://github.com/andOrlando/rubato.git](https://github.com/andOrlando/rubato.git) <br/>

Background Picture: <br/>
Fabrizio Conti - [mountains under blue and grey sky](https://unsplash.com/photos/_6LZtmrss08) <br/>

Big thanks to these pioneers!
