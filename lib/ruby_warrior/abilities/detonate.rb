module RubyWarrior
  module Abilities
    class Detonate < Base
      def description
        'Detonate a bomb in a given direction (forward by default) which damages that space and surrounding 4 spaces (including yourself).'
      end

      def perform(direction = :forward)
        verify_direction(direction)
        return unless @unit.position

        @unit.say "detonates a bomb #{direction} launching a deadly explosion."
        bomb(direction, 1, 0, 8)
        [[1, 1], [1, -1], [2, 0], [0, 0]].each do |x_dir, y_dir|
          bomb(direction, x_dir, y_dir, 4)
        end
      end

      def bomb(direction, x_dir, y_dir, damage_amount)
        return unless @unit.position

        receiver = space(direction, x_dir, y_dir).unit
        return unless receiver

        if receiver.abilities[:explode!]
          receiver.say "caught in bomb's flames which detonates ticking explosive"
          receiver.abilities[:explode!].perform
        else
          damage(receiver, damage_amount)
        end
      end
    end
  end
end
