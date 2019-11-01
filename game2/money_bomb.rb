require 'gosu'

class MoneyBomb < Gosu::Window
    def initialize
        super 940, 660
        self.caption = "Money Bomb"
        @background_image = Gosu::Image.new("tree.png", :tileable => true )

        @player = Player.new
        @apple = Apple.new
        @apples = Array.new

    end

    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @player.left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @player.right
        end

        if rand(100) < 4 && @apples.size < 10
            @apples.push(Apple.new)
        end
        
    end

    def draw
        @player.applesgone(@apples, @apple.x, @apple.y)
        @apple.move
        @font = Gosu::Font.new(20)
        @player.draw
        @player.move
        @background_image.draw(-10,0,0)
        @font.draw("Score: #{@player.score}", 10, 10, 1, 2.0, 2.0, Gosu::Color::RED)
        # @font.draw("Angle: #{@player.angle}", 10, 100, 1, 2.0, 2.0, Gosu::Color::GREEN)
        @apples.each { |apple| apple.draw}


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
        @angle = @score = 0
        @angle_vel = 0.500
        @vel = 0.000

    end
    def x
        @x
    end

    def angle
        @angle
    end
    def score
        @score
    end

    def applesgone(apple_array, apple_x, apple_y)
        apple_array.reject! do |apple|
            if apple_y > 600
                return true
            elsif Gosu.distance(@x, 550, apple_x, apple_y) < 100
                @score += 10
                return true
            else
                return false
            end
        end
    end

    def left
        
        @vel -= 1.5
        

        @angle -= 5
        @angle_vel = 0.5
    end

    def right
        
        @vel += 1.5
        
        @angle += 5
        @angle_vel = 0.5
    end

    def move
        if @x < 50
            @vel = 0
            @x = 51
        end
        if @x > 890
            @vel = 0
            @x = 889
        end

        @angle %= 360
        @angle_vel *= 1.02
        @x += @vel

        @vel *= 0.95

        if @angle >= 0 && @angle < 180
            @angle += @angle_vel
        end

        if @angle > 170 && @angle < 190
            @angle = @score = 0
            @angle_vel = 0.5
        end

        if @angle <= 360 && @angle > 180
            @angle -= @angle_vel
        end
    end

    def draw
        @image.draw_rot(@x, 550, 1, @angle)
    end
    

end

module ZOrder
    BACKGROUND, APPLES, PLAYER, UI = *0..3
end

class Apple

    def x
        @x
    end

    def y
        @y
    end

    def initialize
        @y = 100
        @x = rand(100..800)
        @vel = rand(1..3)
        @image = Gosu::Image.new("apple.jpg")
        @angle = rand(0..360)
       
    end

    def draw
        img = @image
        img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
            ZOrder::APPLES, 0.2, 0.2)
        move
    end


    def move
        @y += @vel
    end 

end

MoneyBomb.new.show