class Volunteer
  attr_accessor :first_name, :last_name, :id

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @id = attributes[:id]
  end

  def Volunteer.all
    results = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    results.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      id = volunteer.fetch('id')
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :id => id}))
    end
    volunteers
  end
end
