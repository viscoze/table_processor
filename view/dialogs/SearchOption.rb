require './view/HTMLPanel'
require './view/UIHelper'
require './controller/SearchHelper'

class SearchOption
  include UIHelper
  include SearchHelper

  def initialize(table_processor)
    @table_processor = table_processor
  end

  def get_all_search_option
    [search_first_option, search_second_option, search_third_option]
  end

  private

  def search_first_option
    mainPanel    = JPanel.new BorderLayout.new
    enterPanel   = JPanel.new
    pagePanel    = initialize_paginate_panel

    surnameLabel = JLabel.new "Surname: "
    groupLabel   = JLabel.new "Group: "
    tablePanel   = HTMLPanel.new

    surnameText  = JTextField.new 10
    groupText    = JTextField.new 10

    seacrhButton = JButton.new "Search ->"

    seacrhButton.add_action_listener do
      @table_processor.search_panel = tablePanel
      surname = surnameText.getText
      group   = groupText.getText
      @table_processor.render do |table|
        table.select do |student|
          relevant_student?(student, surname: surname, group: group)
        end
      end
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add groupLabel
    enterPanel.add groupText
    enterPanel.add seacrhButton

    mainPanel.add enterPanel, BorderLayout::NORTH
    mainPanel.add tablePanel, BorderLayout::CENTER
    mainPanel.add pagePanel,  BorderLayout::SOUTH

    mainPanel
  end

  def search_second_option
    mainPanel    = JPanel.new BorderLayout.new
    enterPanel   = JPanel.new
    resultPanel  = JPanel.new

    surnameLabel = JLabel.new "Surname: "
    markLabel    = JLabel.new "Mark: "
    resultLabel  = JLabel.new

    surnameText  = JTextField.new 10
    minText      = JTextField.new 3
    maxText      = JTextField.new 3

    seacrhButton = JButton.new "Search ->"

    seacrhButton.add_action_listener do |e|
      resultLabel.setText ""
      surname = surnameText.getText
      min     = minText.getText.to_i
      max     = maxText.getText.to_i
      student = @table_processor.search_student_by_average_exam_mark surname, min, max
      resultLabel.setText @table_processor.get_student_string student if student
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add markLabel
    enterPanel.add minText
    enterPanel.add maxText
    enterPanel.add seacrhButton

    resultPanel.add resultLabel

    mainPanel.add enterPanel,   BorderLayout::NORTH
    mainPanel.add resultPanel,  BorderLayout::CENTER

    mainPanel
  end

  def search_third_option
    mainPanel    = JPanel.new BorderLayout.new
    enterPanel   = JPanel.new
    resultPanel  = JPanel.new

    surnameLabel = JLabel.new "Surname: "
    markLabel    = JLabel.new "Mark: "
    subjectLabel = JLabel.new "Subject: "
    resultLabel  = JLabel.new

    surnameText  = JTextField.new 5
    subjectText  = JTextField.new 5
    minText      = JTextField.new 2
    maxText      = JTextField.new 2

    seacrhButton = JButton.new "->"

    seacrhButton.add_action_listener do |e|
      resultLabel.setText ""
      surname = surnameText.getText
      subject = subjectText.getText
      student = @table_processor.search_student_by_subject surname, subject
      resultLabel.setText @table_processor.get_student_string student if student
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add subjectLabel
    enterPanel.add subjectText
    enterPanel.add markLabel
    enterPanel.add minText
    enterPanel.add maxText
    enterPanel.add seacrhButton

    resultPanel.add resultLabel

    mainPanel.add enterPanel,   BorderLayout::NORTH
    mainPanel.add resultPanel,  BorderLayout::CENTER

    mainPanel
  end
end
