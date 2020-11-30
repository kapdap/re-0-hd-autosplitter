// Resident Evil/BioHazard 0 HD Auto Splitter
// Released by Kapdap 2020/11/30
// https://github.com/kapdap/re-0-hd-autosplitter
//
// Description:
// This script is a modification of 0_yumi_0's Resident Evil 0 HD Auto Splitter.
// https://www.speedrun.com/tools/Resident_Evil_0_HD_-_Auto_Splitter_bz6k6.zip
// https://www.speedrun.com/re0/resources
//
// Modifications:
// - Custom split names
// - Ability to undo splits
// - Refactored code
//
// Acknowledgements:
// 0_yami_0 - https://www.speedrun.com/user/0_yami_0
// CursedToast - http://www.speedrun.com/user/CursedToast

state("re0hd")
{
    float time: "re0hd.exe", 0x9CDE9C, 0x3c;
    int cutsceneId: "re0hd.exe", 0x9CE008, 0x20;
    byte roomIdCur: "re0hd.exe", 0x9CE070, 0x1FD4;
    byte roomIdNext: "re0hd.exe", 0x9CDEB8, 0x20;
    byte menuId: "re0hd.exe", 0xA2F414, 0xd74, 0x14, 0x8, 0x34, 0xc, 0x47c;
}

startup
{
    // Split tracker
    vars.splits = new Dictionary<string, bool>();

    // Inventory split tracker
    vars.itemSplits = new Dictionary<byte, bool>();
    vars.itemIndex = new Dictionary<byte, string>();

    // Adds a split
    vars.AddSplit = (Action<string, bool, string>)((split, default_value, description) => {
        vars.splits.Add(split, false);
        settings.Add(split, default_value, description);
    });

    // Adds an inventory split
    vars.AddItemSplit = (Action<byte, string, bool, string>)((id, split, default_value, description) => {
        vars.itemSplits.Add(id, false);
        vars.itemIndex.Add(id, split); // Map item id to split name
        settings.Add(split, default_value, description);
    });

    // Resets split tracker
    vars.ResetSplits = (Action) (() => {
        List<string> keys = new List<string>(vars.splits.Keys);
        foreach(string key in keys)
        {
            vars.splits[key] = false;
        }
    });

    // Resets inventory split tracker
    vars.ResetItemSplits = (Action) (() => {
        List<byte> keys = new List<byte>(vars.itemSplits.Keys);
        foreach(byte key in keys)
        {
            vars.itemSplits[key] = false;
        }
    });

    settings.Add("itemGroup", true, "Items");
    settings.CurrentDefaultParent = "itemGroup"
    vars.AddItemSplit(103, "diningCarKey", true, "Dining Car Key");
    vars.AddItemSplit(125, "icePick", true, "Ice Pick");
    vars.AddItemSplit(82, "panelOpener", true, "Panel Opener");
    vars.AddItemSplit(59, "briefcase", true, "Briefcase");
    vars.AddItemSplit(104, "hookshot", true, "Hookshot");
    vars.AddItemSplit(122, "jewelryBox", true, "Jewelry Box");
    vars.AddItemSplit(58, "silverRing", true, "Silver Ring");
    vars.AddItemSplit(75, "blueKeycard", true, "Blue Keycard");
    vars.AddItemSplit(77, "magneticCard", true, "Magnetic Card");
    vars.AddItemSplit(86, "crankHandle", true, "Crank Handle");
    vars.AddItemSplit(133, "blackStatue", true, "Black Statue");
    vars.AddItemSplit(132, "whiteStatue", true, "White Statue");
    vars.AddItemSplit(68, "fireKey", true, "Fire Key");
    vars.AddItemSplit(63, "lighterFluid", true, "Lighter Fluid");
    vars.AddItemSplit(99, "microfilmA", true, "Microfilm A");
    vars.AddItemSplit(88, "bookOfGood", true, "Book of Good");
    vars.AddItemSplit(126, "ironNeedle", true, "Iron Needle");
    vars.AddItemSplit(100, "microfilmB", true, "Microfilm B");
    vars.AddItemSplit(124, "moDisk", true, "MO Disk");
    vars.AddItemSplit(89, "bookOfEvil", true, "Book of Evil");
    vars.AddItemSplit(120, "statueOfEvil", true, "Statue of Evil");
    vars.AddItemSplit(121, "statueOfGood", true, "Statue of Good");
    vars.AddItemSplit(70, "waterKey", true, "Water Key");
    vars.AddItemSplit(79, "unityTablet", true, "Unity Tablet");
    vars.AddItemSplit(83, "viseHandle", true, "Vise Handle");
    vars.AddItemSplit(80, "obedienceTablet", true, "Obedience Tablet");
    vars.AddItemSplit(94, "battery", true, "Battery");
    vars.AddItemSplit(81, "disciplineTablet", true, "Discipline Tablet");
    vars.AddItemSplit(117, "leechCapsule", true, "Leech Capsule");
    vars.AddItemSplit(71, "blLeechCharm", true, "Bl. Leech Charm");
    vars.AddItemSplit(92, "inputRegCoil", true, "Input Reg. Coil");
    vars.AddItemSplit(72, "grLeechCharm", true, "Gr. Leech Charm");
    vars.AddItemSplit(96, "sterilizingAgent", true, "Sterilizing Agent");
    vars.AddItemSplit(66, "breedingRoomKey", true, "Breeding Rm. Key");
    vars.AddItemSplit(118, "dial", true, "Dial");
    vars.AddItemSplit(93, "outputRegCoil", true, "Output Reg. Coil");
    vars.AddItemSplit(73, "upKey", true, "Up Key");
    vars.AddItemSplit(67, "elevatorKey", true, "Elevator Key");
    vars.AddItemSplit(87, "handle", true, "Handle");
    vars.AddItemSplit(97, "motherboard", true, "Motherboard");
    vars.AddItemSplit(129, "emptyBattery", true, "Empty Battery");
    vars.AddItemSplit(95, "hiPowerBattery", true, "Hi-Power Battery");
    vars.AddItemSplit(102, "shaftKey", true, "Shaft Key");

    vars.AddItemSplit(57, "goldRing", true, "Gold Ring");
    vars.AddItemSplit(65, "trainKey1", true, "Train Key 1");
    vars.AddItemSplit(76, "keycard", true, "Keycard");
    vars.AddItemSplit(78, "lockerKey", true, "Locker Key");
    vars.AddItemSplit(105, "lighter", true, "Lighter");
    vars.AddItemSplit(107, "conductorsKey", true, "Conductor's Key");
    vars.AddItemSplit(119, "duraluminCase", true, "Duralumin Case");
    vars.AddItemSplit(128, "industrialWater", true, "Industrial Water");
    vars.AddItemSplit(130, "angelWings", true, "Angel Wings");
    vars.AddItemSplit(131, "blackWing", true, "Black Wing");

    settings.Add("eventsGroup", true, "Events");
    settings.CurrentDefaultParent = "eventsGroup"
    vars.AddSplit("train", true, "Train");
    vars.AddSplit("clock", true, "Clock");
    vars.AddSplit("rebeccaSaved", true, "Rebecca Saved");
    vars.AddSplit("bat", true, "Bat");
    vars.AddSplit("tyrant1", true, "Tyrant 1");
    vars.AddSplit("tyrant2", true, "Tyrant 2");
    vars.AddSplit("queenLeechStart", true, "Queen Leech - Start");
    vars.AddSplit("queenLeechEnd", true, "Queen Leech - End");

    vars.AddSplit("scorpion", true, "Scorpion");
    vars.AddSplit("centipede", true, "Centipede");
    vars.AddSplit("center1", true, "Center 1");
    vars.AddSplit("underground", true, "Underground");
    vars.AddSplit("center2", true, "Center 2");
    vars.AddSplit("noMoreHunters", true, "No More Hunters");
    vars.AddSplit("laboratory", true, "Laboratory");
    vars.AddSplit("crates", true, "Crates");
    vars.AddSplit("factory", true, "Factory");

    // Application information
    settings.Add("infoGroup", false, "Info");
    settings.CurrentDefaultParent = "infoGroup"
    settings.Add("infoGroup1", false, "Resident Evil/BioHazard 0 HD released by Kapdap");
    settings.Add("infoGroup2", false, "Originally developed by 0_yami_0 & CursedToast");
    settings.Add("infoGroup3", false, "Website: https://github.com/kapdap/re-0-hd-autosplitter");
    settings.Add("infoGroup4", false, "Last Update: 2020-11-30T11:00:00+1200");
}

init
{
    // Update split status
    vars.UpdateSplit = (Func<string, bool>)((split) => {
        if (!vars.splits[split])
        {
            print("Split: " + split);
            vars.splits[split] = true;
            return settings[split];
        }
        else
            return false;
    });

    // Update item split status
    vars.UpdateItemSplit = (Func<byte, bool>)((id) => {
        if (!vars.itemSplits[id])
        {
            print("Item Split: " + vars.itemSplits[id] + " (" + id.ToString() + ")");
            vars.itemSplits[id] = true;
            return settings[vars.itemIndex[id]];
        }
        else
            return false;
    });

    // Read inventory for both characters
    vars.inventory = new MemoryWatcherList();

    for (int j = 0; j < 2; ++j)
    {
        int offset = j == 0 ? 0x24 : 0x64; // Rebecca : Billy

        for (int i = 0; i < 6; ++i)
        {
            DeepPointer pointer = new DeepPointer(0x9CDF44, offset + i * 8);
            MemoryWatcher<byte> watcher = new MemoryWatcher<byte>(pointer);

            vars.inventory.Add(watcher);
        }
    }
}

start
{
    return (old.menuId == 17 || old.menuId == 46) && current.menuId == 0 ||
           (old.menuId == 27 && current.menuId == 28);
}

update
{
    vars.inventory.UpdateAll(game);

    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.ResetItemSplits();
        vars.ResetSplits();
    }
}

split
{
    // Split when an inventory entry changes
    foreach (MemoryWatcher<byte> item in vars.inventory)
    {
        // Continue if the entry has not changed
        if (item.Current == item.Old)
            continue;

        // Split the first time an item has been added to the inventory
        if (vars.itemSplits.ContainsKey(item.Current))
            return vars.UpdateItemSplit(item.Current);
    }

    if (current.roomIdCur == 11 && current.roomIdNext == 3)
        return vars.UpdateSplit("scorpion");

    if (current.cutsceneId == 491515)
        return vars.UpdateSplit("train");

    if (current.cutsceneId == 27230203)
        return vars.UpdateSplit("centipede");

    if (current.roomIdCur == 50 && current.roomIdNext == 45)
        return vars.UpdateSplit("clock");

    if (current.roomIdCur == 36 && current.roomIdNext == 86)
        return vars.UpdateSplit("center1");

    if (current.roomIdCur == 91 && current.roomIdNext == 90)
        return vars.UpdateSplit("rebeccaSaved");

    if (current.roomIdCur == 90 && current.roomIdNext == 42)
        return vars.UpdateSplit("underground");

    if (current.roomIdCur == 43 && current.roomIdNext == 99)
        return vars.UpdateSplit("center2");

    if (current.roomIdCur == 100 && current.roomIdNext == 101)
        return vars.UpdateSplit("bat");

    if (current.roomIdCur == 109 && current.roomIdNext == 103)
        return vars.UpdateSplit("noMoreHunters");

    if (current.roomIdCur == 111 && current.roomIdNext == 132)
        return vars.UpdateSplit("laboratory");

    if (current.roomIdCur == 134 && current.roomIdNext == 166)
        return vars.UpdateSplit("tyrant1");

    if (current.roomIdCur == 154 && current.roomIdNext == 153)
        return vars.UpdateSplit("crates");

    if (current.roomIdCur == 160 && current.roomIdNext == 159)
        return vars.UpdateSplit("tyrant2");

    if (current.roomIdCur == 174 && current.roomIdNext == 164)
        return vars.UpdateSplit("factory");

    if (current.roomIdCur == 164 && current.roomIdNext == 173)
        return vars.UpdateSplit("queenLeechStart");

    //if (current.menuId == 21)
        //return vars.UpdateSplit("queenLeechEnd");
}

gameTime
{
    return TimeSpan.FromSeconds(current.time / 30.0);
}

isLoading
{
    return true;
}