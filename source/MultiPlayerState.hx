package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.input.gamepad.FlxGamepad;
/**
 * autore@ Francesco Pio Pipino
 * Menu per il gioco Online
 * Non funzionerà mai, insomma. è HaxeFlixel!
 */
class MultiPlayerState extends MusicBeatState
{
    var bg:FlxSprite;
    var testo:FlxText;

    override function create()
    {
        var bg = new FlxSprite(Paths.image('menuBG'));
        bg.antialiasing = true;
        bg.screenCenter();
        add(bg);

        var testo = new FlxText(370.49, 107.75, 0, "ONLINE LOBBY" + "Join a Online Lobby?", 40);
        testo.setFormat("VCR OSD Mono", 40, FlxColor.WHITE);
        add(testo);

        super.create();
    }

    override function update(elpased:Float)
    {
        if (controls.ACCEPT || FlxG.keys.justPressed.SPACE)
        {
            FlxG.switchState(new MainMenuState());
        }

        super.update(elpased);
    }
}