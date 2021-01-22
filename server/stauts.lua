util.AddNetworkString("GuckNachUntenDuSpast")

hook.Add("Think", "SendMeDeinVerficktesMode", function()
    for k,v in pairs(player.GetAll()) do
        state = v.buildmode
        net.Start("GuckNachUntenDuSpast")
        net.WriteBool(state)
        net.Send(v)
    end
end)    