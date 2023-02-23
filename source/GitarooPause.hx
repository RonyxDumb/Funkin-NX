package;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.graphics.frames.FlxAtlasFrames;

class GitarooPause extends MusicBeatState
{
	var replayButton:FlxSprite;
	var cancelButton:FlxSprite;

	var replaySelect:Bool = false;

	public function new():Void
	{
		super();
	}

	override function create()
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('pauseAlt/pauseBG'));
		add(bg);

		var bf:FlxSprite = new FlxSprite(0, 30);
		bf.frames = Paths.getSparrowAtlas('pauseAlt/bfLol');
		bf.animation.addByPrefix('lol', "funnyThing", 13);
		bf.animation.play('lol');
		add(bf);
		bf.screenCenter(X);

		replayButton = new FlxSprite(FlxG.width * 0.28, FlxG.height * 0.7);
		replayButton.frames = Paths.getSparrowAtlas('pauseAlt/pauseUI');
		replayButton.animation.addByPrefix('selected', 'bluereplay', 0, false);
		replayButton.animation.appendByPrefix('selected', 'yellowreplay');
		replayButton.animation.play('selected');
		add(replayButton);

		cancelButton = new FlxSprite(FlxG.width * 0.58, replayButton.y);
		cancelButton.frames = Paths.getSparrowAtlas('pauseAlt/pauseUI');
		cancelButton.animation.addByPrefix('selected', 'bluecancel', 0, false);
		cancelButton.animation.appendByPrefix('selected', 'cancelyellow');
		cancelButton.animation.play('selected');
		add(cancelButton);

		changeThing();

		super.create();
	}

	override function update(elapsed:Float)
	{
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
        
		if (gamepad != null)
        {
            updateGamepadInput(gamepad);
        }

		if (gamepad.analog.justMoved.RIGHT_STICK || controls.UI_LEFT_P || controls.UI_RIGHT_P || gamepad.analog.justMoved.LEFT_STICK)
			changeThing();

		if (controls.ACCEPT || gamepad.justPressed.START || gamepad.justPressed.A)
		{
			if (replaySelect)
			{
				FlxG.switchState(new PlayState());
			}
			else
			{
				FlxG.switchState(new MainMenuState());
			}
		}

		super.update(elapsed);
	}

	function updateGamepadInput(gamepad:FlxGamepad):Void
		{
			if (gamepad.pressed.A)
			{
				trace("The bottom face button of the controller is pressed.");
			}
	
			if (gamepad.analog.justMoved.LEFT_STICK_X)
			{
				trace("The x axis of the left analog stick of the controller has been moved.");
			}
		}

	function changeThing():Void
	{
		replaySelect = !replaySelect;

		if (replaySelect)
		{
			cancelButton.animation.curAnim.curFrame = 0;
			replayButton.animation.curAnim.curFrame = 1;
		}
		else
		{
			cancelButton.animation.curAnim.curFrame = 1;
			replayButton.animation.curAnim.curFrame = 0;
		}
	}
}
