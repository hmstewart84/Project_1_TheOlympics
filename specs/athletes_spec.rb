require ('minitest/autorun')
require('minitest/rg')
require_relative ('../models/athlete')
require('pry-byebug')

class TestAthlete < Minitest::Test
    
    def setup()
      @athlete = Athlete.new({
        "first_name" => "Hannah",
        "last_name" => "Stewart"
        })
    end

  def test_pretty_name()
    assert_equal('Hannah Stewart', @athlete.pretty_name() )
  end    
      
  def test_first_name
    assert_equal("Hannah", @athlete.first_name() )
  end  

  def test_last_name
    assert_equal("Stewart", @athlete.last_name() )
  end  








end