require 'gosu'

class Game_Setup < Gosu::Window
    def initialize
        super 300, 300
        self.caption = "Tutorial Game"
        @tiles = Array.new
    end

    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            
        end

        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            
        end

        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_DOWN
            
        end

        if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_BUTTON_DOWN
            
        end

    end


    def draw


    end

end

class tiles
    attr_reader :x, :y

    def initialize



    end

    def draw


    end


Game_Setup.new.show