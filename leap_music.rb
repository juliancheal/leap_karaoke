require 'artoo'

class DaftPunkBot < Artoo::Robot

  connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
  device :leapmotion, :driver => :leapmotion

  def initialize
    super
  end

  work do
    after 51.seconds do
      puts "GO GO GO!!!"
    end
    on leapmotion, :open => :on_open
    on leapmotion, :gesture => :on_gesture
    on leapmotion, :close => :on_close
  end


  def on_open(*args)
    system "afplay audio/harder_better_faster_stronger.mp3 &"

    @songs = %w{ work_it.wav 
              make_it.wav
              do_it.wav
              makes_us.wav
              harder.wav
              better.wav
              faster.wav
              stronger.wav
              more_than.wav
              hour.wav
              our.wav
              never.wav
              ever.wav
              after.wav
              work_is.wav
              over.wav
            }
  end 


  def on_close(*args)
  end

  def on_gesture(*args)
    gesture = args[1]
    puts gesture.type
    case gesture.type
      when "keyTap"
        song = "audio/#{(@songs.push @songs.shift).last}"
        puts song
        system "afplay #{song} &"
    end
  end
end

robot = DaftPunkBot.new
DaftPunkBot.work!(robot)