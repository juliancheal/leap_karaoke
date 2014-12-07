require 'artoo'

class DaftPunkBot < Artoo::Robot

  connection :keyboard, adaptor: :keyboard
  device :keyboard, driver: :keyboard, connection: :keyboard

  def initialize
    @lyrics = ["Work It", "Make It", "Do It", "Makes Us", "Harder", "Better", "Faster", "Stronger", "More Than", "Hour", "Our", "Never", "Ever", "After", "Work is" , "Over"]
    super
  end

  work do
    puts "Harder Faster Keyboarder..."

    on keyboard, :key => :keypress
    
    after 51.seconds do
      puts "GO GO GO!!!"
    end
  end


  def start
    system "afplay audio/harder_better_faster_stronger.mp3 &"

    # @vlc = VLC::System.new
    # @vlc.connect
    # @vlc.volume(200)
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

  def keypress(sender, key)
    if key.eql?("1")
      start
    else
      puts key
      song = "audio/#{(@songs.push @songs.shift).last}"
      puts song
      system "afplay #{song} &"
    end
  end
end

robot = DaftPunkBot.new
DaftPunkBot.work!(robot)