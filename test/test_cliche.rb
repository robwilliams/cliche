require 'helper'

class TestCliche < Test::Unit::TestCase

  include Cliche

  context "Note.new('E')" do
    
    setup do
      @note = Note.new('E')
    end
    
    context "#next" do
      should "return the next note" do
        assert_equal "F", @note.next.to_s
      end
    end
  end

  {
    'C'  => %w{ C D E F G A B },
    'D'  => %w{ D E F# G A B C#},
    'E'  => %w{ E F# G# A B C# D#},
    'F'  => %w{ F G A A# C D E },
    'G'  => %w{ G A B C D E F# },
    'A'  => %w{ A B C# D E F# G# }, 
    'B'  => %w{ B C# D# E F# G# A# },
    'C#' => %w{ C# D# F F# G# A# C},
    'Db' => %w{ Db Eb F Gb Ab Bb C },
    'Eb' => %w{ Eb F G Ab Bb C D },
    'F#' => %w{ F# G# A# B C# D# F },
    'Gb' => %w{ Gb Ab Bb B Db Eb F },
    'Ab' => %w{ Ab Bb C Db Eb F G },
    'Bb' => %w{ Bb C D Eb F G A }
  }.each { |key, scale|
  
    context "Scale.new('#{key}')" do
      
      setup do
        @scale = Scale.new(Note.new(key))
      end
      
      context "#notes" do
        
        should "return the correct notes" do
          assert_equal scale.collect{|note| Note.new(note)}.join(','), @scale.notes.join(',')
        end
      end    
    end
  }
end
