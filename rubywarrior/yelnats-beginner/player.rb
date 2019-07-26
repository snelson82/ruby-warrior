class Player
  HEALTH = 20
  def play_turn(warrior)
    @ahead_of_me = warrior.feel
    puts @ahead_of_me
    warrior.walk!
    # case @ahead_of_me
    # when 'nothing'
    #   if warrior.health == HEALTH
    #     puts 'walking'
    #     warrior.walk!
    #   elsif warrior.health < HEALTH
    #     puts 'resting'
    #     warrior.rest!
    #   else
    #     puts 'attacking'
    #     warrior.attack!
    #   end
    # when 'captive'
    #   warrior.rescue!
    # else
    #   puts 'not sure'
    # end
  end
end
