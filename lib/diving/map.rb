module Map

  class Scene
    @@scenes = {
    'start' => Start.new(),
    'deck' => Deck.new()
    }
    # these make it easy for you to access the variables
    attr_reader :name
    attr_reader :paths
    attr_reader :description

    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end

    def self.get_scene(scene)
      return @@scenes[scene]
    end

    # def get_choice(input)
    #   choice = $stdin.gets.chomp
    #   unless choice.downcase == 'exit'
    #     return choice.downcase
    #   else
    #     exit(1)
    #   end
    # end

    # def is_affirmative?(choice)
    #   affirmative = ["yes", "y", "yup", "ok", "heck yeah", "i guess", "hell yeah"]
    #   affirmative.include? choice
    # end

    def go(direction)
      return @paths[direction]
    end

    def add_paths(paths)
      @paths.update(paths)
    end

    START = Scene.new("Start",
      """
      DIVING INTO THE WRECK
      ... ... ... ... ... ...
      A story/game based on the poem by Adrienne Rich
      ... ... ... ... ... ...
      ... ... ... ... ... ...
      You find yourself aboard a sun-flooded schooner, alone.
      """)

    DECK = Scene.new("Deck",
      """
      You find yourself aboard a sun-flooded schooner, alone.
      There's a pile of diving gear on the deck, and some tools.
      There is a ladder.
      """)

    LADDER = Scene.new("Ladder",
      """
      The ladder is always there
      hanging innocently
      close to the side of the schooner.
      We know what it is for,
      we who have used it.
      Otherwise
      it is a piece of maritime floss
      some sundry equipment.
      """)

    CENTRAL_CORRIDOR = Scene.new("Central Corridor",
      """
      The Gothons of Planet Percal #25 have invaded your ship and destroyed
      your entire crew.  You are the last surviving member and your last
      mission is to get the neutron destruct bomb from the Weapons Armory,
      put it in the bridge, and blow the ship up after getting into an
      escape pod.

      You're running down the central corridor to the Weapons Armory when
      a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
      flowing around his hate filled body.  He's blocking the door to the
      Armory and about to pull a weapon to blast you.
      """)

    LASER_WEAPON_ARMORY = Scene.new("Laser Weapon Armory",
      """
      Lucky for you they made you learn Gothon insults in the academy.
      You tell the one Gothon joke you know:
      Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
      The Gothon stops, tries not to laugh, then busts out laughing and can't move.
      While he's laughing you run up and shoot him square in the head
      putting him down, then jump through the Weapon Armory door.

      You do a dive roll into the Weapon Armory, crouch and scan the scene
      for more Gothons that might be hiding.  It's dead quiet, too quiet.
      You stand up and run to the far side of the scene and find the
      neutron bomb in its container.  There's a keypad lock on the box
      and you need the code to get the bomb out.  If you get the code
      wrong 10 times then the lock closes forever and you can't
      get the bomb.  The code is 3 digits.
      """)

    THE_BRIDGE = Scene.new("The Bridge",
      """
      The container clicks open and the seal breaks, letting gas out.
      You grab the neutron bomb and run as fast as you can to the
      bridge where you must place it in the right spot.

      You burst onto the Bridge with the netron destruct bomb
      under your arm and surprise 5 Gothons who are trying to
      take control of the ship.  Each of them has an even uglier
      clown costume than the last.  They haven't pulled their
      weapons out yet, as they see the active bomb under your
      arm and don't want to set it off.
      """)

    ESCAPE_POD = Scene.new("Escape Pod",
      """
      You point your blaster at the bomb under your arm
      and the Gothons put their hands up and start to sweat.
      You inch backward to the door, open it, and then carefully
      place the bomb on the floor, pointing your blaster at it.
      You then jump back through the door, punch the close button
      and blast the lock so the Gothons can't get out.
      Now that the bomb is placed you run to the escape pod to
      get off this tin can.

      You rush through the ship desperately trying to make it to
      the escape pod before the whole ship explodes.  It seems like
      hardly any Gothons are on the ship, so your run is clear of
      interference.  You get to the chamber with the escape pods, and
      now need to pick one to take.  Some of them could be damaged
      but you don't have time to look.  There's 5 pods, which one
      do you take?
      """)

    THE_END_WINNER = Scene.new("The End",
      """
      You jump into pod 2 and hit the eject button.
      The pod easily slides out into space heading to
      the planet below.  As it flies to the planet, you look
      back and see your ship implode then explode like a
      bright star, taking out the Gothon ship at the same
      time.  You won!
      """)

    THE_END_LOSER = Scene.new("The End",
      """
      You jump into a random pod and hit the eject button.
      The pod escapes out into the void of space, then
      implodes as the hull ruptures, crushing your body
      into jam jelly.
      """
      )

    ESCAPE_POD.add_paths({
      '2' => THE_END_WINNER,
      '*' => THE_END_LOSER
    })

    GENERIC_DEATH = Scene.new("death", "You died.")

    START.add_paths({
      'look' => DECK,
      'cheat' => CENTRAL_CORRIDOR
    })

    LADDER.add_paths({
      'look' => CENTRAL_CORRIDOR,
      'cheat' => CENTRAL_CORRIDOR
    })

    DECK.add_paths({
      'look' => CENTRAL_CORRIDOR,
      'book' => CENTRAL_CORRIDOR #book_of_myths
    })

    THE_BRIDGE.add_paths({
      'throw the bomb' => GENERIC_DEATH,
      'slowly place the bomb' => ESCAPE_POD
    })

    LASER_WEAPON_ARMORY.add_paths({
      '0132' => THE_BRIDGE,
      '*' => GENERIC_DEATH
    })

    CENTRAL_CORRIDOR.add_paths({
      'shoot!' => GENERIC_DEATH,
      'dodge!' => GENERIC_DEATH,
      'tell a joke' => LASER_WEAPON_ARMORY
    })

    START = START

    # A whitelist of allowed scene names. We use this so that
    # bad people on the internet can't access random variables
    # with names.  You can use Test::constants and Kernel.const_get
    # too.
    SCENE_NAMES = {
      'START' => START,
      'DECK' => DECK,
      'LADDER' => LADDER,
      'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
      'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
      'THE_BRIDGE' => THE_BRIDGE,
      'ESCAPE_POD' => ESCAPE_POD,
      'THE_END_WINNER' => THE_END_WINNER,
      'THE_END_LOSER' => THE_END_LOSER,
      'START' => START,
    }

    def Map::load_scene(session)
      # Given a session this will return the right scene or nil
      return SCENE_NAMES[session[:scene]]
    end

    def Map::save_scene(session, scene)
      # Store the scene in the session for later, using its name
      session[:scene] = SCENE_NAMES.key(scene)
    end
  end

  class Start < Scene
    def enter()
      puts "DIVING INTO THE WRECK"
      puts "... ... ... ... ... ..."
      puts "A story/game based on the poem by Adrienne Rich"
      puts "... ... ... ... ... ..."
      puts "... ... ... ... ... ..."
      puts "You find yourself aboard a sun-flooded schooner, alone."
      return 'deck'
    end
  end

  class Deck < Scene
    def enter()
      gear = {"wetsuit"=>false, "flippers"=>false, "mask"=>false}
      tools = {"book of myths"=>false, "camera"=>false, "film"=>false, "knife"=>false}
      ready = false
      puts "There's a pile of diving gear on the deck, and some tools."
      puts "There is a ladder."
      puts "You are having to do this not like Cousteau with his assiduous team."

      while !ready
        choice = get_choice

        case choice
        when "look"
          puts "You're alone on the schooner."
          if (gear.values.include?(false))
            puts "There's a pile of diving gear on the deck, and some tools."
          else
            puts "You're wearing your diving gear, and holding some tools."
          end
          puts "There is a ladder."

        when "help", "what"
          if (gear.values.include?(false))
            puts "Maybe you should put on your diving gear. (try 'gear')"
          elsif (tools.values.include?(false))
            puts "Are your tools ready to go? (try 'tools')"
          end

        else
          puts "Maybe you should try something else. ('Help' for hint)"

        end

        unless gear.values.include?(false) || tools.values.include?(false)
          ready = true
        end
      end
      puts "You feel ready."
      puts "Go down?"
      choice = get_choice

      if is_affirmative?(choice)
        look_at_ladder(ready)
      else
        puts "Maybe you need a minute. You put your diving gear aside for now."
        return 'deck'
      end
    end

    def look_at_ladder(ready)
      puts "\tThe ladder is always there
          hanging innocently
          close to the side of the schooner.
          We know what it is for,
          we who have used it.
          Otherwise
          it is a piece of maritime floss
          some sundry equipment."
      if ready
        puts "Go down?"
        choice = get_choice
        if is_affirmative?(choice)
          return 'go down'
        else
          puts "Maybe you need a minute. You put your diving gear aside for now."
          return 'deck'
        end
      end
    end
  end
end

