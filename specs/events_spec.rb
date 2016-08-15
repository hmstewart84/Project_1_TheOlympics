require ('minitest/autorun')
require('minitest/rg')
require_relative ('../models/event')
require('pry-byebug')

class TestEvent < Minitest::Test
    
    def setup()
      @event = Event.new({
        "name" => "300 metres",
        "sport" => "Athletics"
        })
    end

def test_name
  assert_equal("300 metres", @event.name() )
end  

def test_sport
  assert_equal("Athletics", @event.sport() )
end  


end    
