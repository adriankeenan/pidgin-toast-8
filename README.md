pidgin-toast-8
==============
Pidgin plugin for windows 8 toast notifications using console-toast-8.
Toast notifications contain the senders alias, avatar and leading message content.

![pidgin-toast-8 screenshot](http://adriankeenan.co.uk/media/pidgin-toast-8.png)

Install
=======
Firstly, big thanks to [forward2mobile](http://code.google.com/p/forward2mobile/) for the their [install instructions](http://code.google.com/p/forward2mobile/wiki/HowToInstall) (this script is based off their script too).

Secondly, this project displays toasts by invoking console-toast-8 via the console, so you will need to clone and build that too.

1. Install a flavour of Perl for Windows if you don't have it already:
    - [Strawberry Perl 5.10.1.5](http://strawberryperl.com/download/5.10.1.5/strawberry-perl-5.10.1.5.msi) - Pidgin 2.9.x can only work with Strawberry Perl version 5.10.x.
    - [ActivePerl 5.10.1.1007 (google search)](http://www.google.com/search?q=ActivePerl-5.10.1.1007-MSWin32-x86-291969.msi) -  Again Pidgin 2.9.x can only work with ActivePerl version 5.10.x (32bit).
2. Restart Pidgin and go to Help:Build Information in the menu. Scroll to the bottom and check for "Perl: Enabled". If Perl is disabled, restart and/or reinstall Pidgin or reinstall Perl until it is enabled.
3. Save the .pl script under C:\Users\your_user\AppData\Roaming\\.purple\plugins (plugins dir might not exist yet).
4. Save pidgin.ico in C:\Program Files (x86)\Pidgin (this is used as the application icon which appears on the toast).
5. Clone and build [console-toast-8](https://github.com/adriankeenan/console-toast-8), then add \bin\Release to your PATH.
6. Restart pidgin.
7. Check that the script is enabled under Tools->Plugins.
8. Optionally you can unpin the pidgin-toast-8 shortcut from your start screen, just don't delete the physical shortcut (this is required for toasts to work).
9. Optionally you can edit the call to console-toast-8 to make notifications silent or remove avatars for more text (check the readme for options).

License
=======
GNU GPL v2 ([as required by Pidgin](https://developer.pidgin.im/wiki/Scripting%20and%20Plugins#Aretherelicensingrestrictionsonplugins)).
