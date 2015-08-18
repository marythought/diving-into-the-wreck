class Scene

  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end

  def get_choice
    print "> "
    choice = $stdin.gets.chomp
    unless choice.downcase == 'exit'
      return choice.downcase
    else
      exit(1)
    end
  end

  def is_affirmative?(choice)
    affirmative = ["yes", "y", "yup", "ok", "heck yeah", "i guess", "hell yeah"]
    affirmative.include? choice
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('ending')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
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
    puts "You find yourself aboard a sun-flooded schooner, alone."
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

      when "look at gear", "gear"
        if gear.values.include?(false)
          gear.each {|k,v| puts k unless v == true}
        else
          puts "You are wearing all the gear."
        end

      when "look at tools", "tools"
        if tools.values.include?(false)
          tools.each {|k,v| puts k unless v == true}
        else
          puts "Your tools are ready."
        end

      when "flippers", "put on flippers", "equip flippers", "look at flippers"
        if gear["flippers"]
          puts "You are already wearing the flippers."
        else
          puts "You put on the absurd flippers."
          gear["flippers"] = true
        end

      when "wetsuit", "put on wetsuit", "look at wetsuit"
        if gear["wetsuit"]
          puts "You are already wearing the wetsuit."
        else
          puts "You put on the body-armor of black rubber."
          gear["wetsuit"] = true
        end

      when "look at camera", "camera", "film"
        if tools["camera"]
          puts "Your camera is loaded."
        else
          puts "The camera needs film."
        end

      when "put on mask", "mask", "look at mask"
        if gear["mask"]
          puts "You are already wearing the mask."
        else
          puts "You put on the grave and awkward mask."
          gear["mask"] = true
        end

      when "read book", "book", "read the book of myths", "read book of myths", "look at book"
        if tools["book of myths"]
          puts "You have read the book."
        else
          puts "You read the book of myths. You don't see your name in it..."
          tools["book of myths"] = true
        end

      when "load camera", "load film", "load camera with film", "put film in camera"
        if tools["camera"]
          puts "Your camera is loaded."
        else
          puts "You load the film into the camera."
          tools["camera"] = true
          tools["film"] = true
        end

      when "check knife", "knife", "look at knife"
        if tools["knife"]
          puts "Your knife is ready."
        else
          puts "You check the edge of the knife-blade. It's ready to go."
          tools["knife"] = true
        end

      when "put on gear"
        puts "Try putting it on one piece at a time."

      when "go down", "look at ladder", "ladder"
        look_at_ladder(ready)
        puts "You're not ready to go into the water yet."

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

class GoDown < Scene
  def enter()
    puts "\tI go down.
        Rung after rung and still
        the oxygen immerses me
        the blue light
        the clear atoms
        of our human air."
    puts "(Keep going?)"
    choice = get_choice
    if !(is_affirmative?(choice))
      puts "You climb back up to the deck and take off all your gear."
      return 'deck'
    else
      return 'keep going'
    end
  end
end

class KeepGoing < Scene
  def enter()
    puts "\tI go down.
        My flippers cripple me,
        I crawl like an insect down the ladder
        and there is no one
        to tell me when the ocean
        will begin."
    puts "(Keep going?)"
    choice = get_choice
    if !(is_affirmative?(choice))
      puts "You climb back up to the deck and take off all your gear."
      return 'deck'
    else
      return 'forgetting'
    end
  end
end

class Forgetting < Scene
  def enter()
    puts "\tFirst the air is blue and then
        it is bluer and then green and then
        black I am blacking out and yet
        my mask is powerful
        it pumps my blood with power
        the sea is another story
        the sea is not a question of power
        I have to learn alone
        to turn my body without force
        in the deep element."
    puts "(Keep going?)"
    choice = get_choice
    puts "(It's too late to turn back, even if you wanted to.)"
    puts "\tAnd now: it is easy to forget
        what I came for
        among so many who have always
        lived here
        swaying their crenellated fans
        between the reefs
        and besides
        you breathe differently down here."
    return 'wreck outside'
  end
end

class WreckOutside < Scene
  def enter()
    puts "What did you come here for?"
    choice = get_choice

    case choice
    when "i came to explore the wreck", "i came to see the damage that was done"
      return 'wreck inside'
    else
      puts "\tI came to explore the wreck.
        The words are purposes.
        The words are maps.
        I came to see the damage that was done
        and the treasures that prevail."
      return 'wreck outside'
    end
  end
end

class WreckInside < Scene
  def enter()
    puts "\tI stroke the beam of my lamp
        slowly along the flank
        of something more permanent
        than fish or weed
        the thing I came for:"
    puts "Do you go inside?"
    choice = get_choice
    if is_affirmative?(choice)
      return 'explore wreck'
    else
      return 'wreck outside'
    end
  end
end

class ExploreWreck < Scene
  def enter()
    awareness = 0
    puts "look up, down, and around"
    shipwreck = [
      "the ribs of the disaster curving their assertion among the tentative haunters",
      "the drowned face always staring toward the sun",
      "evidence of damage worn by salt and sway into this threadbare beauty",
      "silver, copper, vermeil cargo lies obscurely inside barrels half-wedged and left to rot",
      "water-eaten log, fouled compass",
      "half-destroyed instruments that once held to a course"
    ]

    while awareness < 6
      choice = get_choice

      case choice
      when "look around", "around", "look down", "down", "look up", "up", "look"
        puts "You see #{shipwreck[0]}"
        shipwreck.shift
        awareness +=1
      else
        puts "You see the wreck and not the story of the wreck, the thing itself and not the myth. Keep looking."
      end
    end
    puts "You've seen enough."
    return "ending"
  end
end

class Ending < Scene
  def enter()
    puts "\tThis is the place.
        And I am here, the mermaid whose dark hair
        streams black, the merman in his armored body.
        We circle silently
        about the wreck
        we dive into the hold."
    puts "Who are you?"
    choice = get_choice
    puts "\tWe are, I am, you, #{choice}, are
        by cowardice or courage
        the one who find our way
        back to this scene
        carrying a knife, a camera
        a book of myths
        in which
        our names do not appear."
  end
end

class Quit < Scene
  def enter()
    puts "You leave the diving for someone else."
    exit(1)
  end
end

class Map
  @@scenes = {
    'start' => Start.new(),
    'deck' => Deck.new(),
    'go down' => GoDown.new(),
    'keep going' => KeepGoing.new(),
    'forgetting' => Forgetting.new(),
    'wreck outside' => WreckOutside.new(),
    'wreck inside' => WreckInside.new(),
    'explore wreck' => ExploreWreck.new(),
    'ending' => Ending.new(),
    'quit' => Quit.new()
  }
  def initialize (start_scene)
    @start_scene = start_scene
  end

  def next_scene (scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('start')
a_game = Engine.new(a_map)
a_game.play()
