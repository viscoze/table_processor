include Java

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import java.awt.BorderLayout

class UserInterface
  def initialize(table_processor = nil)
    @frame = JFrame.new
    @table_processor = table_processor

    initialize_frame_settings
    initialize_user_interface
  end

  def initialize_frame_settings
    @frame.setTitle "Table by Vlad"
    @frame.setSize 800,610
    @frame.setLocationRelativeTo nil
    @frame.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
    @frame.setVisible true
    @frame.setResizable false
  end

  def initialize_user_interface
    mainPanel  = JPanel.new BorderLayout.new 3,1

    menuPanel = initialize_menu_panel
    pagePanel = initialize_paginate_panel
    tablePanel = JPanel.new

    mainPanel.add menuPanel, BorderLayout::NORTH
    mainPanel.add tablePanel,BorderLayout::CENTER
    mainPanel.add pagePanel, BorderLayout::SOUTH

    @frame.add mainPanel
  end

  def initialize_menu_panel
    menuPanel    = JPanel.new

    createButton = JButton.new "Add New Student"
    searchButton = JButton.new "Search and Delete"

    menuPanel.add createButton
    menuPanel.add searchButton

    menuPanel
  end

  def initialize_paginate_panel
    pagePanel  = JPanel.new

    firstButton = JButton.new "First Page"
    lastButton  = JButton.new "Last Page"
    nextButton  = JButton.new "Next Page >"
    prevButton  = JButton.new "< Prev Page"

    pagePanel.add firstButton
    pagePanel.add prevButton
    pagePanel.add nextButton
    pagePanel.add lastButton

    pagePanel
  end
end
