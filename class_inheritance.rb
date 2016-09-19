

class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def bonus(multiplier)
    (salary) * multiplier
  end

end




class Manager < Employee

  attr_accessor :subordinates

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @subordinates = []
  end

  def bonus(multiplier)
    total_bonus = 0
    workers_q = @subordinates.dup

    until workers_q.empty?
      person = workers_q.pop
      total_bonus += person.salary
      if person.is_a?(Manager)
        person.subordinates.each {|subs| workers_q.unshift(subs)}
      end
    end

    total_bonus * multiplier
  end
end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.subordinates << shawna
darren.subordinates << david
ned.subordinates << darren
