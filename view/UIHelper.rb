module UIHelper
  def initialize_menu_panel
    menuPanel    = JPanel.new
    addDialog    = AddDialog.new    @frame, @table_processor
    searchDialog = SearchDialog.new @frame, @table_processor

    createButton = JButton.new "Add New Student"
    searchButton = JButton.new "Search Students"

    createButton.add_action_listener { addDialog.get_add_dialog }
    searchButton.add_action_listener { searchDialog.get_search_dialog }

    menuPanel.add createButton
    menuPanel.add searchButton

    menuPanel
  end

  def initialize_paginate_panel
    start_index = 0
    number_of_student = @table_processor.get_table_size
    pagePanel  = JPanel.new

    firstButton = JButton.new "First Page"
    lastButton  = JButton.new "Last Page"
    nextButton  = JButton.new "Next Page >"
    prevButton  = JButton.new "< Prev Page"

    paginText   = JTextField.new 4
    enterButton = JButton.new ">"

    firstButton.add_action_listener do
      start_index = 0
      @table_processor.render start_index, number_of_student
    end

    lastButton.add_action_listener do
      start_index = @table_processor.get_table_size - number_of_student
      @table_processor.render start_index, number_of_student
    end

    nextButton.add_action_listener do
      start_index += number_of_student
      @table_processor.render start_index, number_of_student
    end

    prevButton.add_action_listener do
      start_index -= number_of_student
      @table_processor.render start_index, number_of_student
    end

    enterButton.add_action_listener do
      start_index = 0
      number_of_student = paginText.get_text.to_i
      @table_processor.render 0, number_of_student
      paginText.set_text "#{number_of_student}/#{@table_processor.get_table_size}"
    end

    pagePanel.add firstButton
    pagePanel.add prevButton
    pagePanel.add paginText
    pagePanel.add enterButton
    pagePanel.add nextButton
    pagePanel.add lastButton

    pagePanel
  end

  def initialize_menubar
    menubar   = JMenuBar.new
    file_menu = JMenu.new "File"

    open_item = JMenuItem.new "Open"
    save_item = JMenuItem.new "Save"
    exit_item = JMenuItem.new "Exit"
    default_open_item = JMenuItem.new "Open Default File"

    open_item.add_action_listener do
      choose_file  = JFileChooser.new
      file_filter = FileNameExtensionFilter.new "xml files", "xml"

      choose_file.addChoosableFileFilter file_filter
      choosen_xml_file = choose_file.showDialog @frame, "Choose XML file"

      if choosen_xml_file == JFileChooser::APPROVE_OPTION
        file = choose_file.getSelectedFile
        @table_processor.read file.get_path.to_s
        @table_processor.render
      end

    end

    save_item.add_action_listener { @table_processor.save }
    exit_item.add_action_listener { @frame.dispose }
    default_open_item.add_action_listener do
      @table_processor.read
      @table_processor.render
    end

    file_menu.add open_item
    file_menu.add default_open_item
    file_menu.add_separator
    file_menu.add save_item
    file_menu.add_separator
    file_menu.add exit_item

    menubar.add file_menu

    @frame.setJMenuBar menubar
  end
end
