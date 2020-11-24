class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def all_students
        BoatingTest.all.map {|test| test.student if test.instructor == self}.compact
    end

    def passed_students
        BoatingTest.all.map {|test| test.student if test.instructor == self && test.test_status == "passed"}.compact
    end

    def pass_student(student, test_name)
        BoatingTest.all.each do |test|
          if test.test_name == test_name && test.student == student
            test.test_status = "passed" 
            return test
          else
            return BoatingTest.new(student, test_name, "passed", self)
          end
        end
    end

    def fail_student(student, test_name)
        BoatingTest.all.each do |test|
            if test.test_name == test_name && test.student == student 
                test.test_status = "failed"
                return test
            else 
                return BoatingTest.new(student, test_name, "failed", self)
            end
        end
    end

end
