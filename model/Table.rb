class Table

  attr_accessor :table

  def initialize
    @table = []
  end

  def add(surname, group, subjects_and_marks)
    @table.push({surname: surname, group: group, marks: subjects_and_marks})
  end

  def delete(student)
    @table.delete student
  end

end
