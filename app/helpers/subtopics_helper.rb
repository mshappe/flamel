module SubtopicsHelper
  def available_people(subtopic)
    Person.where.not(id: subtopic.people.collect(&:id)).map do |p|
      [p.sca_name, p.id]
    end
  end
  def assigned_people(subtopic)
    subtopic.people.map do |p|
      [p.sca_name, p.id]
    end
  end
end
