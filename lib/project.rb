class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def id
    @id
  end

  def save
    saved_project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = saved_project.first().fetch("id").to_i
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end
end
