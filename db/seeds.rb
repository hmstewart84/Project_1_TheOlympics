require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')

Athlete.delete_all()
Event.delete_all()
Nation.delete_all()