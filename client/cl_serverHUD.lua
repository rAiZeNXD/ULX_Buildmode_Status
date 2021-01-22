local state = false
local cleanup = false
local timeLeft = 31
local timerAddOne = 0

net.Receive("GuckNachUntenDuSpast", function()
    state = net.ReadBool()
end)

hook.Add("HUDPaint", "playerModeCheck", function()
    surface.SetFont( "Trebuchet24" )
    draw.RoundedBox( 5, ScrW() - (ScrH() - 75), ScrH() - 23, 80, 20, Color(0, 0, 0, 255) )
    print(state)
    if state == false then
        surface.SetTextPos(ScrW() - (ScrH() - 90)  , ScrH() - 25 )
		surface.SetTextColor( 255, 0, 0, 255 )
        surface.DrawText( "PvPer" )
    elseif state == true then
        surface.SetTextPos(ScrW() - (ScrH() - 85)  , ScrH() - 25 )
		surface.SetTextColor( 0, 255, 0, 255 )
        surface.DrawText("Builder")
    end
    if cleanup == true then
        local timeNow = CurTime()
        surface.SetTextPos(ScrW()/2 - 400  , ScrH() - 405 )
        surface.SetTextColor( 255, 0, 0, 255 )
        surface.PlaySound("ambient/alarms/combine_bank_alarm_loop4.wav")
        surface.DrawText("ACHTUNG!")
        surface.SetTextColor(255, 255, 255, 255)
        surface.DrawText(" In ".. timeLeft .. " Sekunden werden alle Gegenstände gelöscht! Speichere deine Sachen ab!")
        --print(timeLeft .." ".. math.floor(timerAddOne) .. " " .. math.floor(timeNow))
        if timeNow > timerAddOne then
            timeLeft = timeLeft - 1
            timerAddOne = timeNow + 1
            if timeLeft == 0 then
                LocalPlayer():ConCommand("stopsound")
                cleanup = false
                timeLeft = 30
            end    
        end         
    end    
end)