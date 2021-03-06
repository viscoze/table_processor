module SearchHelper
  def relevant_student?(student, search_conditions)
    case search_conditions.size
    when 1
      return student[:group] == search_conditions[:group]
    when 2
      return student[:surname] == search_conditions[:surname] &&
             student[:group] == search_conditions[:group]
    when 3
      return student[:surname] == search_conditions[:surname] &&
             average?(student,search_conditions[:min],search_conditions[:max])
    when 4
      return student[:surname] == search_conditions[:surname] &&
             student[:marks].keys.include?(search_conditions[:subject]) &&
             include_to_range?(student[:marks][search_conditions[:subject]].to_i,
             search_conditions[:min],search_conditions[:max])
    end
  end

  def search_students(surname, group)
    students = []
    @table.table.each do |student|
      students << student if student[:surname] == surname or student[:group] == group
    end
    students
  end

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
    include_to_range?(average_mark, min, max)
  end

  def include_to_range?(number, min, max)
    (min..max).include? number
  end
end
