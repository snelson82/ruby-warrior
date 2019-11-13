module RubyWarrior
  class Tower
    attr_reader :path

    def initialize(path)
      @path = File.join(File.expand_path('../../towers', __dir__), path)
    end

    def name
      File.basename(path)
    end
    alias to_s name
  end
end
