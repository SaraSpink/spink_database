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

  def project_id
    @project_id
  end

  def ==(another_volunteer)
  self.name().==(another_volunteer.name()).&(self.id().==(another_volunteer.id())).&(self.project_id().==(another_volunteer.project_id()))
end
end
