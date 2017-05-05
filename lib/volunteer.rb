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
      id = volunteer.fetch('id').to_i()
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (first_name, last_name) VALUES ('#{first_name}', '#{last_name}') RETURNING id;")
    @id = result.first['id'].to_i()
  end

  def ==(another_volunteer)
    self.first_name().==(another_volunteer.first_name()).&(self.last_name().==(another_volunteer.last_name())).&(self.id().==(another_volunteer.id()))
  end

  def Volunteer.find(id)
    Volunteer.all().each() do |volunteer|
      if volunteer.id() == id
        return volunteer
      end
    end
  end
end
