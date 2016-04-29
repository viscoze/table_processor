require './controller/XMLParser'
require './controller/XMLSerializer'
require './controller/SearchHelper'

class TableProcessor
  include SearchHelper

  attr_accessor :panel
  attr_accessor :search_panel

  XML_FILE_NAME = "XML_TEST/LIST_OF_STUDENTS.xml"

  def initialize(table)
    @table = table
    @current_found_users = []
  end

  def render(start_index=0, amount_of_students=@table.table.size)
    if block_given?
      @current_found_users = yield @table.table
      @search_panel.set_table @current_found_users
      return
    end
    @panel.set_table @table.table.slice(start_index, amount_of_students)
  end

  def get_table_size
    @table.table.size
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

  def delete_student!(surname)
    @table.table.each do |student|
      @table.delete student if student[:surname] == surname
    end
  end

  def delete_students!(students)
    students.each do |student_info|
      @table.table.each do |student|
        @table.delete student if student == student_info
      end
    end
  end

  def delete_current_found_students!
    delete_students! @current_found_users
  end

  private

  def get_students_from_xml(xml_file_name)
    @table.table = XMLParser.new(xml_file_name).table
  end

  def get_xml_from_students(xml_file_name)
    XMLSerializer.new(xml_file_name, @table.table)
  end
end
