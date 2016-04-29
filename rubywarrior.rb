class Player

 def play_turn(warrior)
   @warrior = warrior

   @health ||= @warrior.health

   if enemy_in_front?
    warrior.shoot!
   elsif wall?
     warrior.pivot!
   elsif rescue_him
      warrior.rescue!
   elsif should_retreat?
     if !taking_damage?
       warrior.rest!
    else
     warrior.walk!(:backward)
    end
   elsif should_rest?
     warrior.rest!
   elsif can_walk?
     warrior.walk!
    else
     warrior.attack!
   end

   @health = warrior.health
 end


 def can_walk?
   @warrior.feel.empty?
 end

 def should_rest?
   @warrior.feel.empty? &&  damaged? && !taking_damage?
 end

 def taking_damage?
   @health > @warrior.health
 end

 def damaged?
   @warrior.health < 20
 end

 def should_retreat?
   @warrior.health < 8
 end

 def wall?
   @warrior.feel.wall?
 end

 def rescue_him
   @warrior.feel.captive?
 end

 def enemy_in_front?
   ishoot = false
   @checkmage = @warrior.look

   if @checkmage[0].enemy?
     ishoot
   elsif @checkmage[1].captive?
    ishoot
   elsif @checkmage[1].enemy?
    ishoot
   elsif @checkmage[2].enemy?
    ishoot = true
   else
    ishoot
  end
  ishoot
end


end

