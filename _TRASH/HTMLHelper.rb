module HTMLHelper
  def get_student_string(student)
    "<html>
    <table border=1 cellpadding=5>
        <tr>
            <td>Surname</td>
            <td>Group</td>
        </tr>
        <tr>
            <td>#{student[:surname]}</td>
            <td>#{student[:group]}</td>
        </tr>
            #{get_subjects_string student[:marks]}
    </table>
    </html>"
  end

  def get_subjects_string(subjects)
    subjects_string = ""
    subjects.each do |subject, mark|
      subjects_string += "<tr><td>#{subject}</td><td>#{mark}</td></tr>"
    end
    subjects_string
  end
end
