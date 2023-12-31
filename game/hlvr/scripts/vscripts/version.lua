if Entities:GetLocalPlayer():Attribute_GetIntValue("loading_save_file", 0) > 0 and GlobalSys:CommandLineCheck("-noversioninfo") == false then
    -- Script update date and time
    DebugDrawScreenTextLine(5, GlobalSys:CommandLineInt("-h", 15) - 10, 0, "NoVR Version: Dec 28 17:31", 255, 255, 255, 255, 999999)
end
