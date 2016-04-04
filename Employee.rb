class Employee
  attr_accessor :email
  attr_reader :name, :salary, :deposit_account

  private
  def initialize(name, email, salary, deposit_account)
    @name = name
    @email = email
    @salary = salary
    @deposit_account = deposit_account
  end

    def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end


  public
  def to_s
    account = @deposit_account.delete "-"
    account = account.gsub(/\d{5}/, "*****")
   "#{@name} <email: #{@email}> acct: #{account}"
  end

  def vacation_days
    coefficient * 7  
  end

  def bonus
    coefficient * 1000
  end

end


employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

p employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200