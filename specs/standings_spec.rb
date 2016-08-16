require ('minitest/autorun')
require('minitest/rg')
require_relative ('../models/standing')
require_relative ('../models/athlete')
require_relative ('../models/nation')
require_relative ('../models/event')
require_relative ('../models/participation')
require('pry-byebug')

class TestStanding < Minitest::Test
    

    Team.delete_all()
    Match.delete_all()

    def setup()
      
    end


end    