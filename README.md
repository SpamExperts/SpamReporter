# SpamReporter

macOS Report Spam script

## Download

 * [SpamReporterV4.0.dmg](http://download.seinternal.com/mua/SpamReporterV4.0.dmg)

## Using the script

 * Open mail.app
 * Select message(s) for reporting
 * Click mail from the menu
 * Select Services
 * Select SpamReporter

This will then give proceed to report the message (using the yes/ no buttons for the 2 questions)

## Build steps

 * install the [8.5.0-osx-installer.app](http://installbuilder.bitrock.com/installbuilder-8.6.0-osx-installer.dmg installbuilder)
 * rename the sample packages folder to spamreport
 * add the applescript to the spamreport folder
 * adjust the build.sh to add Product name and adjust the build details.
 * run ./build.sh

This should then create a .dmg file that can be used.

Running this file will place a copy of the applescript in the ~/Library/Services folder of the user.

