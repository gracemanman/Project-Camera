-- 
-- Man Zhu
-- 
-- Georgetown University 
-- 
-- Communication, Culture and Technology Program
--
-- Refer to Sample code which is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.
                  
   
--
local bkgd = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
bkgd:setFillColor( 0.878, 0.302, 0.365 )

local text = display.newText( "Tap anywhere to launch Camera", 0, 0, "Calibri", 20 )
text:setTextColor( 255, 255, 255 )
text.x = 0.5 * display.contentWidth
text.y = 0.5 * display.contentHeight

local sessionComplete = function(event)	
	local image = event.target

	print( "Camera ", ( image and "returned an image" ) or "session was cancelled" )
	print( "event name: " .. event.name )
	print( "target: " .. tostring( image ) )

	if image then
		-- center image on screen
		image.x = display.contentWidth/2
		image.y = display.contentHeight/2
		local w = image.width
		local h = image.height
		print( "w,h = ".. w .."," .. h )
	end
end

local listener = function( event )
	media.show( media.Camera, sessionComplete )
	return true
end
bkgd:addEventListener( "tap", listener )