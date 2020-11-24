class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all 
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors
        BoatingTest.all.map {|test| test.instructor if test.student == self}.compact
    end

    def self.find_student(first_name)
        @@all.select {|student| student.first_name == first_name}
    end

    def all_tests
        BoatingTest.all.select {|test| test.student == self}
    end

    def grade_percentage
        total_test = all_tests.count
        total_passed = all_tests.select {|test| test.test_status == "passed"}.count
        total_passed / total_test.to_f * 100
    end

end
