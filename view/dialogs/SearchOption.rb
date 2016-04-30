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
    tablePanel   = HTMLPanel.new
    pagePanel    = initialize_paginate_panel tablePanel

    surnameLabel = JLabel.new "Surname: "
    groupLabel   = JLabel.new "Group: "

    surnameText  = JTextField.new 10
    groupText    = JTextField.new 10

    seacrhButton = JButton.new "Search ->"

    result = []

    seacrhButton.add_action_listener do
      @table_processor.search_panel = tablePanel
      surname = surnameText.getText
      group   = groupText.getText
      @table_processor.render do |table|
        result = table.select do |student|
          relevant_student?(student, surname: surname, group: group)
        end
      end
      error_message mainPanel if result.empty?
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
    tablePanel   = HTMLPanel.new
    pagePanel    = initialize_paginate_panel tablePanel

    surnameLabel = JLabel.new "Surname: "
    markLabel    = JLabel.new "Mark: "

    surnameText  = JTextField.new 10
    minText      = JTextField.new 3
    maxText      = JTextField.new 3

    seacrhButton = JButton.new "Search ->"

    result = []

    seacrhButton.add_action_listener do |e|
      @table_processor.search_panel = tablePanel
      surname = surnameText.getText
      min     = minText.getText.to_i
      max     = maxText.getText.to_i
      @table_processor.render do |table|
        result = table.select do |student|
          relevant_student?(student, surname: surname, min: min, max: max)
        end
      end
      error_message mainPanel if result.empty?
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add markLabel
    enterPanel.add minText
    enterPanel.add maxText
    enterPanel.add seacrhButton

    mainPanel.add enterPanel, BorderLayout::NORTH
    mainPanel.add tablePanel, BorderLayout::CENTER
    mainPanel.add pagePanel,  BorderLayout::SOUTH

    mainPanel
  end

  def search_third_option
    mainPanel    = JPanel.new BorderLayout.new
    enterPanel   = JPanel.new
    tablePanel   = HTMLPanel.new
    pagePanel    = initialize_paginate_panel tablePanel

    surnameLabel = JLabel.new "Surname: "
    markLabel    = JLabel.new "Mark: "
    subjectLabel = JLabel.new "Subject: "

    surnameText  = JTextField.new 5
    subjectText  = JTextField.new 5
    minText      = JTextField.new 2
    maxText      = JTextField.new 2

    seacrhButton = JButton.new "->"

    result = []

    seacrhButton.add_action_listener do
      @table_processor.search_panel = tablePanel
      surname = surnameText.getText
      subject = subjectText.getText
      min     = minText.getText.to_i
      max     = maxText.getText.to_i
      @table_processor.render do |table|
        result = table.select do |student|
          relevant_student?(student, surname: surname, subject: subject,
                                    min: min, max:max)
        end
      end
      error_message mainPanel if result.empty?
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add subjectLabel
    enterPanel.add subjectText
    enterPanel.add markLabel
    enterPanel.add minText
    enterPanel.add maxText
    enterPanel.add seacrhButton

    mainPanel.add enterPanel, BorderLayout::NORTH
    mainPanel.add tablePanel, BorderLayout::CENTER
    mainPanel.add pagePanel,  BorderLayout::SOUTH

    mainPanel
  end

  def error_message(panel)
    JOptionPane.showMessageDialog panel, "Could not find any students!",
              "Error", JOptionPane::ERROR_MESSAGE
  end
end
