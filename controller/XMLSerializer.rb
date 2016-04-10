require 'rexml/document'

class XMLSerializer
  include REXML

  def initialize(file_name, table)
    @table = table
    serialize
  end

  def create_file(file_name)
    File.delete(file_name) if File.exist?(file_name)
    @file = File.open(file_name, "w+")
  end

  def add_to_file(students_table=nil)
    @file.open
  end

  def serialize
  end

  def
end
