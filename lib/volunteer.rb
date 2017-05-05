class Volunteer
  attr_accessor :first_name, :last_name, :hours, :project_id, :id

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @hours = attributes.fetch(:hours)
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def Volunteer.all
    results = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    results.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      hours = volunteer.fetch('hours')
      project_id = volunteer.fetch('project_id').to_i()
      id = volunteer.fetch('id').to_i()
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :hours => hours, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (first_name, last_name, hours, project_id) VALUES ('#{@first_name}', '#{@last_name}', #{@hours}, #{@project_id}) RETURNING id;")
    @id = result.first['id'].to_i()
  end

  def ==(another_volunteer)
    self.first_name().==(another_volunteer.first_name()).&(self.last_name().==(another_volunteer.last_name())).&(self.hours().==(another_volunteer.hours())).&(self.project_id().==(another_volunteer.project_id())).&(self.id().==(another_volunteer.id()))
  end

  def Volunteer.find(id)
    Volunteer.all().each() do |volunteer|
      if volunteer.id() == id
        return volunteer
      end
    end
  end

  def Volunteer.sort_name
    sorted_volunteers = DB.exec("SELECT * FROM volunteers ORDER BY last_name, first_name")
    volunteers = []
    sorted_volunteers.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      hours = volunteer.fetch('hours')
      project_id = volunteer.fetch('project_id').to_i()
      id = volunteer.fetch('id').to_i()
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :hours => hours, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def Volunteer.sort_hours
    sorted_volunteers = DB.exec("SELECT * FROM volunteers ORDER BY hours")
    volunteers = []
    sorted_volunteers.each() do |volunteer|
      first_name = volunteer.fetch('first_name')
      last_name = volunteer.fetch('last_name')
      hours = volunteer.fetch('hours')
      project_id = volunteer.fetch('project_id').to_i()
      id = volunteer.fetch('id').to_i()
      volunteers.push(Volunteer.new({:first_name => first_name, :last_name => last_name, :hours => hours, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def update(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @hours = attributes.fetch(:hours)
    @id = self.id()
    DB.exec("UPDATE volunteers SET first_name = '#{@first_name}', last_name = '#{@last_name}', hours = #{@hours} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end
end
