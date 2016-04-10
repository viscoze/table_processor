require './controller/XMLParser'

class TableProcessor

  XML_FILE_NAME = "XML_TEST/LIST_OF_STUDENTS.xml"

  def initialize(table)
    @table = table
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

  private

  def get_students_from_xml(xml_file_name)
    @table.table = XMLParser.new(xml_file_name).table
  end

  def get_xml_from_students(xml_file_name)
    XMLSerializer.new(xml_file_name, @table.table)
  end
end
