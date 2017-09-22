class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @project_id = attributes[:project_id]
  end

  def name
    @name
  end
end
