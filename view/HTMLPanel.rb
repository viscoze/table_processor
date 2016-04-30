include Java

import javax.swing.JLabel
import javax.swing.JPanel

class HTMLPanel < JPanel
  attr_accessor :html_table

  def initialize
    super
    @html_label = JLabel.new
    self.add @html_label
    set_table
  end

  def render(start_index=0, number_of_student=@students_info.size)
    @html_label.set_text table(@students_info.slice(start_index, number_of_student))
  end

  def set_table(students_info=nil)
    @students_info = students_info
    @html_label.set_text table(@students_info)
  end

  def get_table_size
    @students_info.size
  end

  private

  def set_amount_of_rows(amount)
    @amount_of_rows = amount
  end

  def table(students_info)
    "<html>
    <table border=1 cellpadding=10>
        #{header}
        #{body(students_info)}
    </table>
    </html>"
  end

  def header(amount_of_exams=5)
    "<tr>
       <td rowspan=3>Surname</td>
       <td rowspan=3>Group</td>
       <td colspan=#{amount_of_exams*2}>Exams</td>
     </tr>
     <tr>
       #{get_number_row(amount_of_exams)}
     </tr>
     <tr>
       #{get_subjects_marks_row(amount_of_exams)}
     </tr>"
  end

  def body(students_info)
    return if students_info == nil
    students = ""
    students_info.each do |student|
      students += get_student_row student
    end
    students
  end

  def get_student_row(student)
    marks = ""
    student[:marks].each do |subject, mark|
      marks += "<td>#{subject}</td><td>#{mark}</td>"
    end
    "<tr><td>#{student[:surname]}</td><td>#{student[:group]}</td>#{marks}</tr>"
  end

  def get_number_row(amount_of_exams=5)
    row = ""
    amount_of_exams.times { |index| row += "<td colspan=2>#{index+1}</td>" }
    row
  end

  def get_subjects_marks_row(amount_of_exams=5)
    row = ""
    amount_of_exams.times { row += "<td>Subject</td><td>Mark</td>" }
    row
  end
end
