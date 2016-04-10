require './controller/XMLParser'
require './controller/XMLSerializer'

class TableProcessor

  XML_FILE_NAME = "XML_TEST/LIST_OF_STUDENTS.xml"

  def initialize(table)
    @table = table
    read
    save
  end

  def read
    get_students_from_xml XML_FILE_NAME
  end

  def save
    get_xml_from_students XML_FILE_NAME
  end

  def add_student_to_table(surname, group, subjects_and_marks)
    @table.add_student(surname, group, subjects_and_marks)
  end

  def search_student(surname)
    @table.table.each do |student|
      return student if student[:surname] == surname
    end
  end

  def delete_student(surname)
    @table.table.each do |student|
      @table.delete student if student[:surname] == surname
    end
  end

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

  private

  def get_students_from_xml(xml_file_name)
    @table.table = XMLParser.new(xml_file_name).table
  end

  def get_xml_from_students(xml_file_name)
    XMLSerializer.new(xml_file_name, @table.table)
  end
end
