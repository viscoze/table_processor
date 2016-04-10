class SearchOption

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
    resultPanel  = JPanel.new

    surnameLabel = JLabel.new "Surname: "
    groupLabel   = JLabel.new "Group: "
    resultLabel  = JLabel.new

    surnameText  = JTextField.new 10
    groupText    = JTextField.new 10

    seacrhButton = JButton.new "Search ->"
    deleteButton = JButton.new "Delete"

    seacrhButton.add_action_listener do |e|
      surname = surnameText.getText
      student = @table_processor.search_student surname
      resultLabel.setText @table_processor.get_student_string student
    end

    deleteButton.add_action_listener do |e|
      surname = surnameText.getText
      @table_processor.delete_student surname
    end

    enterPanel.add surnameLabel
    enterPanel.add surnameText
    enterPanel.add groupLabel
    enterPanel.add groupText
    enterPanel.add seacrhButton

    resultPanel.add resultLabel

    mainPanel.add enterPanel,   BorderLayout::NORTH
    mainPanel.add resultPanel,  BorderLayout::CENTER
    mainPanel.add deleteButton, BorderLayout::SOUTH

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
    deleteButton = JButton.new "Delete"

    seacrhButton.add_action_listener do |e|
      surname = surnameText.getText
      student = @table_processor.search_student surname
      resultLabel.setText @table_processor.get_student_string student
    end

    deleteButton.add_action_listener do |e|
      surname = surnameText.getText
      @table_processor.delete_student surname
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
    mainPanel.add deleteButton, BorderLayout::SOUTH

    mainPanel
  end

  def search_third_option
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
    deleteButton = JButton.new "Delete"

    seacrhButton.add_action_listener do |e|
      surname = surnameText.getText
      student = @table_processor.search_student surname
      resultLabel.setText @table_processor.get_student_string student
    end

    deleteButton.add_action_listener do |e|
      surname = surnameText.getText
      @table_processor.delete_student surname
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
    mainPanel.add deleteButton, BorderLayout::SOUTH

    mainPanel
  end
end
