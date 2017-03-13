## CCRevealLoader Tweak 

CCRevealLoader is inspired by [RevealLoader](https://github.com/heardrwt/RevealLoader)

CCRevealLoader dynamically loads RevealServer.framework  (Reveal.app support) into iOS apps on jailbroken devices. Configuration is via the CCRevealLoader menu in Settings.app

Reveal is an OS X application that allows you to remotely introspect a running applications view hierarchy and edit various view properties. 

Generally you have to include their debugging framework in your application at build time in-order to perform debugging actions, however with this tweak installed this is no longer necessary. 

For more info see [revealapp.com](http://revealapp.com)


## Build Requirements

- Theos
- Reveal.app installed

## Install tweak

Change the value of `THEOS_DEVICE_IP` to your jailbreak device's ip in the `Makefile` file at first line, then execute command:

```
make package install
```

## How to Use
Open 'Settings > CCRevealLoader > Enabled Applications' and toggle the application or applications that you want to debug to on.

Launch the target application and it should appear inside Reveal.app on your Mac. 

(You will likely need to quit and relaunch the target application)

## Be Social
Follow me on [Twitter](https://twitter.com/intent/follow?screen_name=nswebfrog) (@nswebfrog)
