class Volunteer
  attr_accessor :first_name, :last_name, :id

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @id = attributes[:id]
  end
end
