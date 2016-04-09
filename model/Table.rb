class Table
  def initialize
    @table = []
  end

  def add_student(surname, group, subjects_and_marks)
    @table.push {surname: surname, group: group, subjects_and_marks}
  end

  def delete_student(surname)
    @table.each { |student| @table.delete student if student[:surname] == surname }
  end

end
