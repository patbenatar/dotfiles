# My dotfiles

1. clone
1. cd in
1. `$ rake install`

## Weather widget
I use this in my tmux control bar. It displays the temp, a little icon for the weather, and whether or not is light out.

#### Dependencies
* Ruby
* Gems: `ywx` and `httparty`
* ENV vars: `WEATHER_YAHOO_APP_ID` and `WEATHER_ZIP_CODE`