import XMonad
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks

mylayoutHook = smartBorders $
	     tiled ||| Mirror tiled ||| noBorders Full

	     where tiled = Tall 1 (3/100) (1/2)
	     
myFocusedBorderColor = "#4286f4"

main = xmonad $ defaultConfig
    { terminal    = "urxvt"
    , layoutHook  = mylayoutHook
    , modMask     = mod4Mask
    , borderWidth = 4
    , focusedBorderColor = myFocusedBorderColor
    }
    `additionalKeys`
    [ ((mod1Mask, xK_m        ), spawn "echo 'Hi, mom!' | dzen2 -p 4")
    , ((mod4Mask, xK_grave    ), toggleWS)	
    ]
