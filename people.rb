

class Students
  def learn
    puts "I get it!"
  end

end

class Instructor
  def teach
    puts "Everything in Ruby is an object."
  end

end

class Person
  attr_accessor :name
  def greeting #This is the best place to create the common greeting method because it is outside of both the student and instructor classes.
    puts "Hello #{@name}"
  end

end

instructor = Person.new
instructor.name = "Chris"
instructor.greeting

student = Person.new
student.name = "Christina"
student.greeting

instructor = Instructor.new
instructor.teach

student = Students.new
student.learn

# It's not possible for the instructor to learn and it's not possible
# for the student to teach. The error will be:
# undefined method `learn' for #<Instructor:0x00562f823c3e28> (NoMethodError)
#The method 'learn' is only for the student.
