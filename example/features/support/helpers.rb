module Helpers
  def table_data(table)
    k = table.headers
    v = table.rows.first
    Hash[[k, v].transpose]
  end

  def print_screen
    page.within_window windows.last do
      page.save_screenshot("screenshots/#{Time.new.to_i} print_screen.png", full: true)
    end
  end
end

World(Helpers)
