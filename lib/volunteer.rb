class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def name
    @name
  end

  def project_id
    @project_id
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name()).&(self.project_id().==(another_volunteer.project_id())).&(self.id().==(another_volunteer.id()))
  end

  def self.all()
    all_volunteers = DB.exec('SELECT * FROM volunteers;')
    volunteers = []
      all_volunteers.each() do |volunteer|
        name = volunteer.fetch("name")
        project_id = volunteer.fetch("project_id")
        id = volunteer.fetch("id").to_i
        volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
      end
    volunteers
  end
end #Volunteer class
