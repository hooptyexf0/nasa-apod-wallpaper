# nasa-apod-wallpaper
Version of weathersat-wallpaper made to pull the latest NASA Astronomy Photo of the Day and set it as the wallpaper

Made to be used as EITHER a daily anacron job, OR a 30 1 * * * & @reboot combo in crontab. (NASA generally uploads new image at ~midnight EST, so A) 30 min buffer and 2) DST weirdness)
Also this doesn't account for the rare times they upload a video as the APOD; Either it will break in a nice way that keeps the last photo as the wallpaper, or you'll get a blank screen. I think.

Wallpaper setting is Preserve Aspect, so for best effect, set background color to black #000000

Must be made executable via chmod +x or thru GUI (Properties->Permissions)

Creates/uses a directory hardcoded to ~/Pictures/...

KDE Plasma 6 specific- Currently tested on Kubuntu 26.04, Plasma 6.6.4  &  Fedora 44 KDE, Plasma 6.7.2

----
This is much more kludgey than weathersat-wallpaper, as it uses a combination of wget and curl (mostly hacked together from various forums and Google AI Overview) to scrape the newest .jpg from the main NASA APOD page instead of relying on there being a directory with latest.jpg like NOAA has for their weathersats.
