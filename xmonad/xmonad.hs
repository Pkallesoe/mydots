import XMonad
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS

main = xmonad $ defaultConfig
    { terminal    = "urxvt"
    , modMask     = mod4Mask
    , borderWidth = 1
    }
    `additionalKeys`
    [ ((mod1Mask, xK_m        ), spawn "echo 'Hi, mom!' | dzen2 -p 4")
    , ((mod4Mask, xK_grave    ), toggleWS)	
    ]
