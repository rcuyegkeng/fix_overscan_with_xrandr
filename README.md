# fix_overscan_with_xrandr

*Shell scripts to fix overscan with xrandr.*

Overscan is the situation in which not all of a televised image is present on a viewing screen. It commonly occurrs when using TV screens as monitors.

The scripts in this repo use xrandr to adjust the overscan. xrandr is a configuration utility to the RandR X Window System extension. It can be used to set the size, orientation or reflection of the outputs for a screen.

## Using xrandr

`xrandr --properties` lists the properties of the monitor.

- Partial output of `xrandr --properties` while using a Toshiba 50HM66 TV.
```
HDMI-0 connected primary 1280x720+0+0 (normal left inverted right x axis y axis) 708mm x 398mm
	EDID: 
		00ffffffffffff005262030200000000
		0010010380c48e000eee91a3544c9926
		0f505400000001010101010101010101
		010101010101011d8018711c1620582c
		2500c48e2100009e8c0ad08a20e02d10
		103e9600c48e21000018000000fc0054
		53422d54560a202020202020000000fd
		003b3d0f2e08000a202020202020013b
		02031676478504030702060123090707
		65030c001000011d007251d01e206e28
		5500c48e2100001e8c0aa01451f01600
		267c4300c48e210000988c0ad08a20e0
		2d10103e9600138e210000188c0aa014
		51f01600267c4300138e210000980000
		00000000000000000000000000000000
		00000000000000000000000000000007
	dither: off 
		supported: off, on
	audio: auto 
		supported: off, on, auto
	underscan vborder: 23 
		range: (0, 128)
	underscan hborder: 35 
		range: (0, 128)
	underscan: on 
		supported: off, on, auto
	coherent: 1 
		range: (0, 1)
   1920x1080i     60.1 +   60.0  
   1280x720       60.0*    59.9  
   1440x480i      60.1     60.1     60.1  
   720x480        60.0     59.9  
   640x480        60.0     59.9  
```

- The Toshiba 50HM66 has 'underscan hborder', 'underscan vborder', and 'underscan' properties.

- xrandr can set those properties to modify the overscan (or underscan).
```
xrandr --output "HDMI-0" --mode "$EXTERNAL_RESOLUTION" --set "underscan hborder" "35" --set "underscan vborder" "23" --set "underscan" "on"`
```

## Automating xrandr on login

- '45custom_xrandr-settings' script based on [Automate xrandr on login](http://www.thinkwiki.org/wiki/Xorg_RandR_1.2#Now_automate_it_on_login)

- Place your xrandr call in '/etc/X11/Xsession.d/45custom_xrandr-settings'.

## Alternatively, put the xrandr call in .xprofile.

- This will only affect a single user.
- Place your xrandr call in $HOME/.xprofile

## Resources:

[xrandr - ArchWIki](https://wiki.archlinux.org/index.php/xrandr)

[Automate xrandr on login](http://www.thinkwiki.org/wiki/Xorg_RandR_1.2#Now_automate_it_on_login)

[Overscan - Wikipedia](https://en.wikipedia.org/wiki/Overscan)
