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
    'C' => %w{ C D E F G A B C}
  }

  context "Scale.new('E')" do
    
    setup do
      @scale = Scale.new(Note.new('E'))
    end
    
    context "#notes" do
      
      should "return the correct notes" do
        assert_equal %w{E F# G# A B C# D#}.collect{|note| Note.new(note)}.join(','), @scale.notes.join(',')
      end
    end    
  end
end
