class Player
  def play_turn(warrior)
    @health = warrior.health

    case @ahead_of_me
    when 'nothing'
      if warrior.health == @health
        warrior.rest!
      elsif warrior.health < @health
        warrior.walk!
      else warrior.attack!
      end
    when 'captive'
      warrior.rescue!
    else
      p @health
      p warrior.feel
    end
    @health = warrior.health
  end
end
