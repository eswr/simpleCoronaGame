-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
_SCREEN = {
	HEIGHT = display.contentHeight,
	WIDTH = display.contentWidth
}

_SCREEN.CENTER = {
	x = display.contentCenterX,
	y = display.contentCenterY
}

display.setStatusBar(display.hiddenStatusBar)
-- local perk = require "plugin.perk"

-- perk.init("22734113fdd0c4f8dbe862eafc1261e0af7e426d")
-- Variable for top alignment axis
local topAlignAxis =  _SCREEN.HEIGHT/3
local userFont = 20

-- Listener function for text input events
local value1 , value2 , result

local function goAway( event )
    display.remove(result)
    display.remove(value2)
    display.remove(value1)
    -- RegisterText.isVisible = true
    display.remove(RegisterText)
    -- display.remove(event.target)
end

local function textListener( event )

--     if ( event.phase == "began" ) then

--         -- Transition group upward to y=50
--         -- transition.to( UIGroup, { time=1000, y=50 } )


--     elseif ( event.phase == "ended" or event.phase == "submitted" ) then

--         local v1 = value1.text
--         local v2 = value2.text 
--         if ( v1 and v2 ) then
--             -- Update the "result" text object
--             if ( v1 == "admin"  and v2 == "admin") then
--                 result.text = "pass"
--             elseif ((v1 == ""  and v2 == "") or (v1 == "") or (v2 == "")) then
--             	result.text = ""
--             else
--                 result.text = "failed"
--             end
            
--             -- Dismiss (hide) the native keyboard
--             native.setKeyboardFocus( nil )
--             -- Transition group back down to y=300
--             -- transition.to( UIGroup, { time = 1000, y = 300 })
--         end
--     end
end
-- create play screen

local function createPlayScreen()
	-- local background = display.newImage("howl.png")
	-- background.y = 130
	-- background.alpha = 0

	local options1 = 
	{
	    text = "Night Owl",
	    x = 90,
	    width = _SCREEN.WIDTH/3,     --required for multi-line and alignment
	    font = native.systemFont,
	    fontSize = 24
	}
	local title = display.newText( options1 )
	title:setFillColor( 1, 0, 0 )
	title.y = topAlignAxis--150

	-- Set anchor Y on object to 0 (top)
	title.anchorY = 0

	-- Create second multi-line text object
	local options2 = 
	{
	    text = "presents",
	    x = _SCREEN.CENTER.x + 90,
	    width =  _SCREEN.WIDTH/3,     --required for multi-line and alignment
	    font = native.systemFont,
	    fontSize = 18
	}
	local titleSuffix = display.newText( options2 )
	titleSuffix:setFillColor( 0.6, 0.4, 0.8 )

	-- Set anchor Y on object to 0 (top)
	titleSuffix.anchorY = 0

	titleSuffix.x = title.x + (24/2)*string.len(title.text)
	titleSuffix.y = title.y + (24/4)



	local usernameText = display.newText( "username", 0, 0, native.systemFontBold, userFont )
	usernameText:setFillColor( 1, 0, 0.5 )
	usernameText.x = title.x - (userFont/4)*string.len(usernameText.text)
	usernameText.y = titleSuffix.y + 2*userFont +12

	value1 = native.newTextField( display.contentCenterX, 150, 160, userFont )
	-- UIGroup:insert( value1 )
	value1:addEventListener( "userInput", textListener )
	value1.inputType = "default"
	value1.x = usernameText.x + _SCREEN.CENTER.x
	value1.y = usernameText.y


	local passwordText = display.newText( "password", 0, 0, native.systemFontBold, userFont )
	passwordText:setFillColor( 1, 0, 0.5 )
	passwordText.x = title.x - (userFont/4)*string.len(passwordText.text)
	passwordText.y = titleSuffix.y + 4*userFont +12 

	
	value2 = native.newTextField( display.contentCenterX, 225, 160, userFont )
	value2:addEventListener( "userInput", textListener )
	value2.inputType = "default"
	value2.x = passwordText.x + _SCREEN.CENTER.x
	value2.y = passwordText.y
	-- local equals = display.newText( "", display.contentCenterX-120, 300, native.systemFont, 80 )
	



	result = display.newText( "", display.contentCenterX, 300, native.systemFont, 80 )
	
	-- local log = 
	-- {
	--     text = "Login",
	--     x = 90,
	--     width = _SCREEN.WIDTH/3,     --required for multi-line and alignment
	--     font = native.systemFont,
	--     fontSize = 18
	-- }
	-- local loginText = display.newText( log )
	local widget = require( "widget" )

	-- Function to handle button events
	local function handleButtonEvent( event )

	    if ( "ended" == event.phase ) then
	    	if (event.target.name == "loginText" ) then
		        print( "Login was pressed and released" )
		        
		        local v1 = value1.text
		        local v2 = value2.text 
		        if ( v1 and v2 ) then
		            -- Update the "result" text object
		            if ( v1 == "admin"  and v2 == "admin") then
		                result.text = "pass"
						goAway(event)
						display.remove(title)
					    display.remove(RegisterText)
					    display.remove(passwordText)
					    display.remove(usernameText)
					    display.remove(titleSuffix)
					    display.remove(skipText)
					    display.remove(passwordText)
					    -- goto zcontinue

					    display.remove(event.target)
					    display.remove(planet)
					    
					    display.remove(skipText)
					    -- loginText.isVisible = false
					    -- RegisterText.isVisible = false
					    -- Dismiss (hide) the native keyboard
						native.setKeyboardFocus( nil )
					    
						startGame()
						-- scorePage()
		                -- title = nil
		            elseif ((v1 == ""  and v2 == "") or (v1 == "") or (v2 == "")) then
		            	result.text = ""
		            else
		                result.text = "failed"
		            end
		            
		            -- Dismiss (hide) the native keyboard
		            -- native.setKeyboardFocus( nil )
		            -- Transition group back down to y=300
		            -- transition.to( UIGroup, { time = 1000, y = 300 })
		        end
		    elseif (event.target == null ) then
		    	-- start_game
		    	
		    elseif (event.target.name == "RegisterText" ) then
		    	print( "Registation Button was pressed and released" )
		        -- end ::zcontinue:: end
		        display.remove(event.target)
		        -- startGame()
		        if (result == "pass") then
		        	-- start_game
		        	-- display.remove(event.target)
		        	-- display.remove(RegisterText)
		        else
		        	result.text = "web-view"
		        end
	        end

	    end
	end

	local RegisterText = widget.newButton
	{
	    left = _SCREEN.CENTER.x,
	    top = 0,
	    id = "RegisterText",
	    label = "Register",
	    onEvent = handleButtonEvent
	}
	RegisterText.name = "RegisterText"

	RegisterText:setFillColor( 0.6, 0.4, 0.8 )
	RegisterText.anchorY = 0
	RegisterText.y = passwordText.y +24

	-- Create the widget
	local loginText = widget.newButton
	{
	    left = 0,
	    top = 0,
	    id = "loginText",
	    label = "Login",
	    onEvent = handleButtonEvent
	}
	loginText.name = "loginText"
		-- loginText:setFillColor( 1, 0, 0 )

	-- Set anchor Y on object to 0 (top)
	loginText.anchorY = 0
	-- Align object to top alignment axis
	loginText.y = RegisterText.y

	-- Create second multi-line text object
	-- local function handleRegEvent( event )

	--     -- if ( "ended" == event.phase ) then
	--     --     print( "Registation Button was pressed and released" )
	--     --     -- if (result == "") then
	--     --     	-- web-view
	--     --     	result = "web-view"
	--     --     -- end
	--     -- end

	--     if ( "ended" == event.phase ) then
	--         print( "Registation Button was pressed and released" )
	        
	--         if (result == "pass") then
	--         	-- start_game
	--         else
	--         	result.text = "web-view"
	--         end
	--     end

	-- end

	
	-- local skipText = display.newText( "skip-->", 0, 0, native.systemFontBold, userFont )
	-- skipText:setFillColor( 1, 0, 0.5 )
	-- skipText.x = _SCREEN.CENTER.x*2 - (userFont/2)*string.len(skipText.text)
	-- skipText.y = _SCREEN.CENTER.y*2 - userFont

	planet = display.newImage("howl.png")
	planet.x = centerX
	planet.y = display.contentHeight + 60
	planet.alpha = 2
	-- transition.to( background, { time=2000, alpha=1,  y=centerY, x=centerX } ) 

end	

function startGame()




	local physics = require("physics")
	physics.start()

	local x_center = _SCREEN.CENTER.x
	local y_center = _SCREEN.CENTER.y
	local game_background = display.newImage("grass.png",x_center,y_center)

	--local screen_top = display.screenOriginY
	--local screen_bottom = display.screenOriginY + display.viewableContentHeight

	local red_paint = {1,0,0}
	local blue_paint = {0,0,1}

	local radius = 20

	local my_score = 0
	local score_label = display.newText("Score: " .. tostring(my_score) ,0 , 0, native.systemFont, 24)
	score_label.x = 50
	score_label.y = 30
	score_label:setFillColor(1,1,0)



	local touchpop = function(event)
		local t = event.target
		local phase = event.phase
		local my_id = event.target.id
		if(phase == "began") then
			if(my_id == "good") then
				my_score = my_score + 1;
				score_label.text = "Score: " .. tostring(my_score)
			end
			if(my_id == "bad") then
				my_score = my_score - 1;
				score_label.text = "Score: " .. tostring(my_score)
			end
		end
			timer.performWithDelay( 1 , function() display.remove(t); end )
		print(my_score)
		return true 
	end

	local balls = {}

	local animate = function(event)
		local drop_x = 40 + math.random(380)
		local drop_y = -40
		local ball
		random_variable = math.random(100)
		if(random_variable < 50) then
			ball = display.newCircle(drop_x, drop_y, radius)
			ball.id = "bad"
			ball.fill = red_paint
			ball.x = drop_x
			ball.y = drop_y
			physics.addBody(ball,{ density=0.6, radius=20 })
		else
			ball = display.newCircle(drop_x, drop_y, radius)
			ball.id = "good"
			ball.fill = blue_paint
			ball.x = drop_x
			ball.y = drop_y
			physics.addBody(ball, { density=0.6, radius=19 })
		end
		table.insert(balls,ball)
		ball:addEventListener( "touch", touchpop)
		
	end

	timer.performWithDelay(1000,animate,20)

	
	timer.performWithDelay( 21000 , function() 
		local text = display.newText( "TIME UP!", 0, 0, "Helvetica", 24 )
		text.x = _SCREEN.CENTER.x
		text.y = _SCREEN.CENTER.y - 30

		text:setFillColor( 1, 0, 0.5 )
		local widget = require( "widget" )

		-- Function to handle button events
		local function handleButtonEvent( event )

		    if ( "ended" == event.phase ) then
		    	if (event.target.name == "RetryText" ) then
			        print( "RETRY was pressed and released" )
			        
			                result.text = "RETrY"
							display.remove(event.target)
						    startGame()
			    elseif (event.target == null ) then
			    	-- start_game
			    	
			    elseif (event.target.name == "ViewScoreBoard" ) then
			    	print( "Registation Button was pressed and released" )
			        -- end ::zcontinue:: end
			        display.remove(event.target)
			        viewScorePage(my_score)
			        -- if (result == "pass") then
			        -- 	-- start_game
			        -- 	-- display.remove(event.target)
			        -- 	-- display.remove(ViewScoreBoard)
			        -- else
			        -- 	result.text = "web-view"
			        -- end
		        end

		    end
		end

		local ViewScoreBoard = widget.newButton
		{
		    left = _SCREEN.CENTER.x,
		    top = 0,
		    id = "ViewScoreBoard",
		    label = "VIEW SCORES",
		    onEvent = handleButtonEvent
		}
		ViewScoreBoard.name = "ViewScoreBoard"

		ViewScoreBoard:setFillColor( 0.6, 0.4, 0.8 )
		ViewScoreBoard.anchorY = 0
		ViewScoreBoard.y = _SCREEN.CENTER.y +24

		-- Create the widget
		local RetryText = widget.newButton
		{
		    left = 0,
		    top = 0,
		    id = "RetryText",
		    label = "RETRY",
		    onEvent = handleButtonEvent
		}
		RetryText.name = "RetryText"
			-- RetryText:setFillColor( 1, 0, 0 )

		-- Set anchor Y on object to 0 (top)
		RetryText.anchorY = 0
		-- Align object to top alignment axis
		RetryText.y = ViewScoreBoard.y
	 end )

	-- t= my_score.now
	-- if (my_score.now == t)





	-- local text = display.newText( "TIME UP!", 0, 0, "Helvetica", 24 )
	-- text.x = _SCREEN.CENTER.x
	-- text.y = _SCREEN.CENTER.y - 30
	
	-- text:setFillColor( 1, 0, 0.5 )
	-- text.x = _SCREEN.CENTER.x*2 - (userFont/2)*string.len(skipText.text) - 12
	-- text.y = _SCREEN.CENTER.y*2 - userFont -12

	-- text:setTextColor(255, 254, 185)
	-- local function goAway(event)
	-- 	display.remove(event.target)
	-- 	text = nil
	-- 	display.remove(title)
	-- 	title = nil
	-- 	-- spawnEnemy()
	-- 	-- scoreTxt.alpha = 1
	-- 	-- scoreTxt.text = "Score: 0"
	-- 	-- score = 0
	-- 	-- planet.numHits = 10
	-- 	-- planet.alpha = 1
	-- 	-- speedBump = 0
	-- end






	-- if (true) then
	-- 	text:addEventListener ( "tap", goAway )
	-- end

end

function viewScorePage( my_score )
	-- body
	local text = display.newText( "Score board", 0, 0, "Helvetica", 24 )
	text.x = _SCREEN.CENTER.x
	text.y =  30
	
	text:setFillColor( 1, 0, 0.5 )
	-- perk.showPortal( )
	-- perk.trackEvent("e94db523d304b1277f7ddb1f0eb406ff7c66d8b0", "true")
	
end
createPlayScreen()


-- display.setDefault( "background", 0.5 )