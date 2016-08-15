require ('minitest/autorun')
require('minitest/rg')
require_relative ('../models/nation')
require('pry-byebug')

class TestNation < Minitest::Test

  def setup()
    @nation = Nation.new({
      "name" => "South Africa",
      })
  end

def test_name
  assert_equal("South Africa", @nation.name() )
end  

end  



