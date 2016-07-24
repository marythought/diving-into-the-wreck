class Deck < ApplicationRecord
  # def deck
  #   gear = {"wetsuit"=>false, "flippers"=>false, "mask"=>false}
  #   tools = {"book of myths"=>false, "camera"=>false, "film"=>false, "knife"=>false}
  #   ready = false
  #   puts "There's a pile of diving gear on the deck, and some tools."
  #   puts "There is a ladder."
  #   puts "You are having to do this not like Cousteau with his assiduous team."
  #
  #   while !ready
  #     choice = get_choice
  #
  #     case choice
  #     when "look"
  #       puts "You're alone on the schooner."
  #       if (gear.values.include?(false))
  #         puts "There's a pile of diving gear on the deck, and some tools."
  #       else
  #         puts "You're wearing your diving gear, and holding some tools."
  #       end
  #       puts "There is a ladder."
  #
  #     when "help", "what"
  #       if (gear.values.include?(false))
  #         puts "Maybe you should put on your diving gear. (try 'gear')"
  #       elsif (tools.values.include?(false))
  #         puts "Are your tools ready to go? (try 'tools')"
  #       end
  #
  #     when "look at gear", "gear"
  #       if gear.values.include?(false)
  #         gear.each {|k,v| puts k unless v == true}
  #       else
  #         puts "You are wearing all the gear."
  #       end
  #
  #     when "look at tools", "tools"
  #       if tools.values.include?(false)
  #         tools.each {|k,v| puts k unless v == true}
  #       else
  #         puts "Your tools are ready."
  #       end
  #
  #     when "put on flippers", "flippers", "look at flippers"
  #       if gear["flippers"]
  #         puts "You are already wearing the flippers."
  #       else
  #         puts "You put on the absurd flippers."
  #         gear["flippers"] = true
  #       end
  #
  #     when "put on wetsuit", "wetsuit", "look at wetsuit"
  #       if gear["wetsuit"]
  #         puts "You are already wearing the wetsuit."
  #       else
  #         puts "You put on the body-armor of black rubber."
  #         gear["wetsuit"] = true
  #       end
  #
  #     when "look at camera", "camera", "look at film"
  #       if tools["camera"]
  #         puts "Your camera is loaded."
  #       else
  #         puts "The camera needs film."
  #       end
  #
  #     when "put on mask", "mask", "look at mask"
  #       if gear["mask"]
  #         puts "You are already wearing the mask."
  #       else
  #         puts "You put on the grave and awkward mask."
  #         gear["mask"] = true
  #       end
  #
  #     when "read book", "book", "read the book of myths", "read book of myths", "look at book"
  #       if tools["book of myths"]
  #         puts "You have read the book."
  #       else
  #         puts "You read the book of myths. You don't see your name in it..."
  #         tools["book of myths"] = true
  #       end
  #
  #     when "load camera", "load film", "load camera with film", "put film in camera", "film"
  #       if tools["camera"]
  #         puts "Your camera is loaded."
  #       else
  #         puts "You load the film into the camera."
  #         tools["camera"] = true
  #         tools["film"] = true
  #       end
  #
  #     when "check knife", "knife", "look at knife"
  #       if tools["knife"]
  #         puts "Your knife is ready."
  #       else
  #         puts "You check the edge of the knife-blade. It's ready to go."
  #         tools["knife"] = true
  #       end
  #
  #     when "put on gear"
  #       puts "Try putting it on one piece at a time."
  #
  #     when "go down", "look at ladder", "ladder"
  #       look_at_ladder(ready)
  #       puts "You're not ready to go into the water yet."
  #
  #     else
  #       puts "Maybe you should try something else. ('Help' for hint)"
  #
  #     end
  #
  #     unless gear.values.include?(false) || tools.values.include?(false)
  #       ready = true
  #     end
  #   end
  #   puts "You feel ready."
  #   puts "Go down?"
  #   choice = get_choice
  #
  #   if is_affirmative?(choice)
  #     look_at_ladder(ready)
  #   else
  #     puts "Maybe you need a minute. You put your diving gear aside for now."
  #     deck
  #   end
  # end
end
