Config { 

-- appearance
font =         "xft:Ricty:size=9:bold:antialias=true,Symbola:size=10:regular:antialias=true"
-- font =         "xft:Bitstream Vera Sans Mono:size=9:bold:antialias=true"
, bgColor =      "black"
, fgColor =      "#B3B3B3"
, position =     Top
, border =       NoBorder
, borderColor =  "#646464"

-- layout
, sepChar =  "%"   -- delineator between plugin names and straight text
, alignSep = "}{"  -- separator between left-right alignment
, template = " 🌠%uname%@%hostname% }{ %battery% %multicpu% %coretemp% %memory% %dynnetwork% || %date% "

-- general behavior
, lowerOnStart =     True    -- send to bottom of window stack on start
, hideOnStart =      False   -- start with window unmapped (hidden)
, allDesktops =      True    -- show on all desktops
, overrideRedirect = True    -- set the Override Redirect flag (Xlib)
, pickBroadest =     False   -- choose widest display (multi-monitor)
, persistent =       True    -- enable/disable hiding (True = disabled)

-- plugins
--   Numbers can be automatically colored according to their value. xmobar
--   decides color based on a three-tier/two-cutoff system, controlled by
--   command options:
--     --Low sets the low cutoff
--     --High sets the high cutoff
--
--     --low sets the color below --Low cutoff
--     --normal sets the color between --Low and --High cutoffs
--     --High sets the color above --High cutoff
--
--   The --template option controls how the plugin is displayed. Text
--   color can be set by enclosing in <fc></fc> tags. For more details
--   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
, commands = [
-- network activity monitor (dynamic interface resolution)
Run DynNetwork     [ "--template" , "⇅:⇧<tx>kB/s ⇩<rx>kB/s"
                     , "--Low"      , "1000"       -- units: kB/s
                     , "--High"     , "5000"       -- units: kB/s
                     , "--low"      , "#079E05"
                     , "--normal"   , "#F9AC00"
                     , "--high"     , "red"
                     ] 10

-- cpu activity monitor
, Run MultiCpu       [ "--template" , "🖥:<total>%"
                     , "--Low"      , "50"         -- units: %
                     , "--High"     , "85"         -- units: %
                     , "--low"      , "#079E05"
                     , "--normal"   , "#F9AC00"
                     , "--high"     , "red"
                     ] 10

-- cpu core temperature monitor
, Run CoreTemp       [ "--template" , "🌡:<core0>℃"
                     , "--Low"      , "70"        -- units: °C
                     , "--High"     , "80"        -- units: °C
                     , "--low"      , "#079E05"
                     , "--normal"   , "#F9AC00"
                     , "--high"     , "red"
                     ] 50

-- memory usage monitor
, Run Memory         [ "--template" ,"💾:<usedratio>%"
                     , "--Low"      , "20"        -- units: %
                     , "--High"     , "90"        -- units: %
                     , "--low"      , "#079E05"
                     , "--normal"   , "#F9AC00"
                     , "--high"     , "red"
                     ] 10

-- battery monitor
, Run Battery        [ "--template" , "<acstatus>"
                     , "--Low"      , "10"        -- units: %
                     , "--High"     , "80"        -- units: %
                     , "--low"      , "red"
                     , "--normal"   , "#F9AC00"
                     , "--high"     , "#079E05"
                     , "--" -- battery specific options
                     -- discharging status
                     , "-o"  , "🔋:<left>% (<timeleft>)"
                     -- AC "on" status
                     , "-O"  , "<fc=#dAA520>⚡:<left>%</fc>"
                     -- charged status
                     , "-i"  , "<fc=#006000>😊:<left>%</fc>"
                     ] 50

, Run Date           "<fc=#ABABAB>%Y/%m/%d(%a) %T</fc>" "date" 10


-- keyboard layout indicator
, Run Com "uname" ["-n"] "" 0
, Run Com "hostname" ["-i"] "" 30
                     ]
}
