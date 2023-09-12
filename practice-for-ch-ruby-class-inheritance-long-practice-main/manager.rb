class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss, employees=[])
        super(name, title, salary, boss)
        @employees = employees 
    end

    def bonus(multiplier)
        dup = employees.dup
        total = bonus_recursive(dup)
        b = total * multiplier
        b
    end

    def bonus_recursive(employees)
        return 0 if employees.empty?
        employees[0].salary + bonus_recursive(employees[1..-1])
    end
end