require 'gosu'

class MoneyBomb < Gosu::Window
    def initialize
        super 940, 660
        self.caption = "Money Bomb"
        @background_image = Gosu::Image.new("tree.png", :tileable => true )

        @player = Player.new

    end

    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @player.left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @player.right
        end
    end

    def draw
        @player.draw
        @player.move
        @background_image.draw(-10,0,0)

    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
    end
end

class Player
    def initialize
        @image = Gosu::Image.new("basket.png")
        @x = 480
        @vel = @angle = 0

    end

    

    def left
        @vel -= 1
        @angle += 0.5
    end

    def right
        @vel += 1
        @angle -= 0.5
    end

    def move
        @x += @vel

        @vel *= 0.95
    end

    def draw
        @image.draw_rot(@x, 550, 1, @angle)
    end
    

end



MoneyBomb.new.show