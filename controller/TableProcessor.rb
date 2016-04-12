require './controller/XMLParser'
require './controller/XMLSerializer'
require './controller/HTMLHelper'

class TableProcessor
  include HTMLHelper

  XML_FILE_NAME = "XML_TEST/LIST_OF_STUDENTS.xml"

  def initialize(table)
    @table = table
  end

  def get_table
    @table.table
  end

  def render
    @panel.set_table get_table
  end

  def set_table_panel(panel)
    @panel = panel
  end

  def read(file_name=XML_FILE_NAME)
    get_students_from_xml file_name
  end

  def save(file_name=XML_FILE_NAME)
    get_xml_from_students file_name
  end

  def add_student(surname, group, subjects_and_marks)
    @table.add(surname, group, subjects_and_marks)
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

  private

  def get_students_from_xml(xml_file_name)
    @table.table = XMLParser.new(xml_file_name).table
  end

  def get_xml_from_students(xml_file_name)
    XMLSerializer.new(xml_file_name, @table.table)
  end
end
