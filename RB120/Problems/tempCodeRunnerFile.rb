class Cat
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def greet
       "Hello! My name is #{@name}!"
    end

  end