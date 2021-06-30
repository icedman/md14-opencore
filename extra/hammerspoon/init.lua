function moveWindowOneSpace(direction)
   local mouseOrigin = hs.mouse.getAbsolutePosition()
   local win = hs.window.focusedWindow()
   local clickPoint = win:zoomButtonRect()

   clickPoint.x = clickPoint.x + clickPoint.w + 5
   clickPoint.y = clickPoint.y + (clickPoint.h / 2)

   hs.timer.usleep(150000)

   local mouseClickEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, clickPoint)
   mouseClickEvent:post()
   hs.timer.usleep(50000)

    hs.osascript.applescript('tell application "System Events" to key code ' .. direction .. ' using control down');

   hs.timer.usleep(50000)

   local mouseReleaseEvent = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, clickPoint)
   mouseReleaseEvent:post()
   hs.timer.usleep(50000)

   hs.mouse.absolutePosition(mouseOrigin)
end

mash = { "cmd", "shift", "ctrl" }

hk1 = hs.hotkey.bind(mash, "right",
             function() moveWindowOneSpace(124) end)
hk2 = hs.hotkey.bind(mash, "left",
             function() moveWindowOneSpace(123) end)