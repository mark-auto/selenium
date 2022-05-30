# SCREENSHOT ON FAILURE

After do |scenario|
  if scenario.failed?
    # specify a name for the location of the screenshot
    i = "screenshots/#{Time.new.to_i} Failure in #{scenario.name} - #{scenario.name}.png"

    page.within_window windows.last do # always use the last open window for the snap!
      page.save_screenshot(i, full: true)
    end
    puts "FAILURE. Screenshot location: #{i}"
  end
end
