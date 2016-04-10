include Java

import javax.swing.JLabel
import javax.swing.JPanel

class HTMLPanel < JPanel
  attr_accessor :html_table

  def initialize
    super
    @html_table = JLabel.new
    self.add @html_table
    set_table
  end

  def set_table
    @html_table.set_text table
  end

  def table
    "<html>
    <table border=1 cellpadding=5>
        #{header}
        #{body}
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

  def body
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
