require 'gosu'

class Tutorial < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "Tutorial Game"

        @background_image = Gosu::Image.new("space.png", :tileable => true)

        @player = Player.new
        @player.warp(320,240)

        @star_anim = Gosu::Image.load_tiles("star.png", 25, 25)
        @stars = Array.new
        @meteors = Array.new
        @font = Gosu::Font.new(20)
       
    end

    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @player.turn_left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @player.turn_right
        end
        if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
            @player.accelerate
        end

        @player.move
        @player.collect_stars(@stars)
        @meteor.crash

        if rand(100) < 4 and @stars.size < 25
            @stars.push(Star.new(@star_anim))
        end

        if rand(100) < 4 and @meteors.size < 5
            @meteors.push(Meteor.new)
        end
    end

    def draw
        @background_image.draw(0,0, ZOrder::BACKGROUND) 
        @player.draw
        @stars.each { |star| star.draw }
        @meteors.each { |meteor| meteor.draw}
        @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)                                            #Coordnates and Angles
        # @font.draw("X: #{@player.x}", 200, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
        # @font.draw("Y: #{@player.y}", 400, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
        # @font.draw("Angle: #{@player.angle}", 400, 100, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)                                     
        
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
        @image = Gosu::Image.new("starfighter.bmp")
        @x = @y = @vel_x = @vel_y = @angle = 0.0
        @score = 0
    end

    def angle
        @angle %= 360
        
    end

    def bounce
        if @x > 640
            @x  -= 40
            @vel_x *= -1
        end
        if  @x < 0 
            @x  += 40
            @vel_x *= -1
        end
        if  @y < 0 
            @y += 40
            @vel_y *= -1
        end
        if  @y > 480
            @y -= 40
            @vel_y *= -1
        end
    end

    def warp(x,y)
        @x,@y = x, y
    end

    def turn_left
        @angle -= 4.5
    end

    def turn_right
        @angle += 4.5
    end

    def accelerate
        @vel_x += Gosu.offset_x(@angle, 0.5)
        @vel_y += Gosu.offset_y(@angle, 0.5)
    end

    def move
        bounce
        @x += @vel_x
        @y += @vel_y

        @vel_x *= 0.95
        @vel_y *= 0.95
    end

    def draw
        @image.draw_rot(@x, @y, 1, @angle)
    end

    def score
        @score
    end
    
    def collect_stars(stars)
        stars.reject! do |star|
            if Gosu.distance(@x, @y, star.x, star.y) < 35 
                @score += 10
                true
            else
                false
            end
        end
        
    end
end


module ZOrder
    BACKGROUND, STARS, PLAYER, METEORS, UI = *0..4
end

class Star
    attr_reader :x, :y
  
    def initialize(animation)
        @animation = animation
        @color = Gosu::Color::BLACK.dup
        @color.red = rand(256 - 40) + 40
        @color.green = rand(256 - 40) + 40
        @color.blue = rand(256 - 40) + 40
        @x = rand * 640
        @y = rand * 480
    end
  
    def draw  
        img = @animation[Gosu.milliseconds / 100 % @animation.size]
        img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
            ZOrder::STARS, 1, 1, @color, :add)
    end
end


class Meteor
    attr_reader :x, :y
  
    def initialize
        @color = Gosu::Color::BLACK.dup
        @color.red = rand(30..40)
        @color.green = rand(30..40)
        @color.blue = rand(30..40)
        @x = rand * 640
        @y = rand * 480
        @x_vel = rand(-5..5)
        @y_vel = rand(-5..5)
    end

    def draw 
        @image = Gosu::Image.new("meteor.jpg") 
        img = @image
        img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
            ZOrder::METEORS, 0.1, 0.1, @color, :add)
    end

    def crash
        @x += @x_vel
        @y += @y_vel
        
        meteors.reject! do |meteor|
            if @x < 0 || @x > 640 || @y < 0 || @y > 240
                true
            else
                false
            end
        end
    end

    
end



Tutorial.new.show
