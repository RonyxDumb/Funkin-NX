package ui;

import lime.app.Application;
import flixel.util.FlxColor;
import ui.OptionsState.OptionsMenu;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;
/**
 * crediti di colui che ha portato sta cosa
 */
class NintendoSwitchState extends MusicBeatState 
{
    var logo:FlxSprite;
    var crediti:FlxText;
    var bg:FlxSprite;
    override function create()
    {
        super.create();

        bg = new FlxSprite(Paths.image("menuBGMagenta"));
        bg.screenCenter();
        bg.antialiasing = true;
        add(bg);

        logo = new FlxSprite(Paths.image("logo"));
        logo.screenCenter();
        logo.antialiasing = true;
        add(logo);

        var crediti = new FlxText(FlxG.height, FlxG.height, 40, 
        "NX (Nintendo Switch)"
        +
        "port by"
        +
        "Francesco Pio Pipino"
         );
        crediti.setFormat("VCR OSD Mono", 40, FlxColor.WHITE);
    }

    override function update(elpased:Float)
    {
        var pressed:Bool = FlxG.keys.justPressed.ANY;
        
        var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

        // dovrebbe essere solo per Nintendo Switch,
        // ma lo lasceremo per coloro che amano i Controller :)
		if (gamepad != null)
		{
			if (gamepad.justPressed.ANY)
				pressed = true;
		}

        if (controls.ACCEPT)
        {
            FlxG.switchState(new MainMenuState());
        }
        super.update(elpased);
    }
}