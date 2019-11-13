module RubyWarrior
  module Abilities
    class Explode < Base
      attr_accessor :time

      def description
        "Kills you and all surrounding units. You probably don't want to do this intentionally."
      end

      def perform
        return unless @unit.position

        @unit.say 'explodes, collapsing the ceiling and damanging every unit.'
        @unit.position.floor.units.map do |unit|
          unit.take_damage(100)
        end
      end

      def pass_turn
        return unless @time && @unit.position

        @unit.say 'is ticking'
        @time -= 1
        perform if @time.zero?
      end
    end
  end
end
