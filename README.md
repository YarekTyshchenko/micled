Toggle System Mic via Keyboard
==============================

Uses scroll lock keyboard LED to show when Mic is live.
Pressing scroll lock toggles mute.
Holding scroll lock makes it push-to-talk.

How to use:

Run micled in background.

Bind scrolllock to run micled-toggle, in i3wm:

```
# Bind MicLed Press and Release actions to Scroll Lock (78)
bindcode 78 exec --no-startup-id micled-toggle press
bindcode --release 78 exec --no-startup-id micled-toggle release

# Disable key repeat on Scroll Lock
exec --no-startup-id xset -r 78

# Run MicLed process
exec micled
```

