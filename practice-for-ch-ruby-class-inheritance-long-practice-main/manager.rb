require "byebug"
require_relative "./employee"

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss, employees=[])
        super(name, title, salary, boss)
        @employees = employees 
    end

    def bonus(multiplier)
        @salary = bonus_recursive(employees)
        # p @salary
        super(multiplier)
        # @salary = salary_holder

    end

    def bonus_recursive(employees)
        return 0 if employees.empty?
        sum = 0
        employees.each do |emp|
            if emp.is_a?(Manager)
                sum += (bonus_recursive(emp.employees) + emp.salary)
            else
                sum += emp.salary 
            end
        end
        # p sum
        sum
        # employees[0].salary + bonus_recursive(employees[1..-1])
    end
end

p david = Employee.new("David", "TA", 10000, "Darren")
p shawna = Employee.new("Shawna", "TA", 12000, "Darren")
p darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
p ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)