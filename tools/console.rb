require_relative '../config/environment.rb'

def reload
  load './config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

jason = Student.new('Jason')
june = Student.new('June')
jeffrey = Student.new('Jeffrey')

eric = Instructor.new("Eric")
caryn = Instructor.new("Caryn")

t1 = BoatingTest.new(jason, 'test 1', eric)
t2 = BoatingTest.new(june, 'test 2', eric)
t3 = BoatingTest.new(jason, 'test 4', caryn)

eric.pass_student(jason, 'test 1')
eric.pass_student(jeffrey, 'test 3')
# p jeffrey.add_boating_test('test 3', 'pending',caryn)
eric.fail_student(jason, 'test 1')
p BoatingTest.all
# binding.pry
#leave this here to ensure binding.pry isn't the last line

