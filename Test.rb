include Java

import javax.swing.JButton
import javax.swing.JFrame
import javax.swing.JPanel
import java.lang.System


class Example < JFrame

    def initialize
        super "Quit button"

        self.initUI
    end

    def initUI

        panel = JPanel.new
        self.getContentPane.add panel

        panel.setLayout nil

        bang_button = JButton.new "Bang"
        bang_button.add_action_listener do |e|
            puts "!"
        end

        b_button = JButton.new "Bang"
        b_button.add_action_listener do |e|
            puts "!"
        end

        panel.add bang_button
        panel.add b_button


        self.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
        self.setSize 300, 200
        self.setLocationRelativeTo nil
        self.setVisible true
    end

end

Example.new
