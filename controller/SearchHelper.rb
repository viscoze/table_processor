module SearchHelper

  def search_student(surname, group)
    @table.table.each do |student|
      return student if student[:surname] == surname and student[:group] == group
    end
  end

  def search_student_by_average_exam_mark(surname, min, max)
    @table.table.each do |student|
      return student if student[:surname] == surname && average?(student,min,max)
    end
    nil
  end

  def search_student_by_subject(surname, subject)
    @table.table.each do |student|
      return student if student[:surname] == surname && student[:marks].keys.include?(subject)
    end
  end

  def average?(student, min, max)
    marks = student[:marks].values.collect { |item| item.to_i }
    average_mark = marks.inject(0) do |sum, mark|
      sum += mark.to_i / marks.size
    end
    (min..max).include? average_mark
  end

end
