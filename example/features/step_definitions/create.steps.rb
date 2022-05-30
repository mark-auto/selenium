When("I go to add a new computer") do
  click_link("Add a new computer")

  # Initiate the class
  @common = Common.new

  expect(@common.page_title.text).to eq("Add a computer")
end

Given("I add a computer with details:") do |table|
  @create = Create.new

  # Converts table to key/value pairing (see support/helpers.rb)
  @table = table_data(table)

  # Given the computer name a unique timestamp
  @table['Computer name'] = "#{@table['Computer name']}#{Time.now.to_i}" if @table.key? "Computer name"

  @create.add_new_computer(@table)

  click_button("Create this computer")
end

Then("I expect to see the computer succesfully added to the table") do
  expect(@common.alert.text).to eq("Done! Computer #{@table['Computer name']} has been created")
end

Then("I expect to see a validation error for {string}") do |error_type|
  @create ||= Create.new

  # Run the assertion by interpolating the error_type argument passed through
  expect(@create.__send__("#{error_type.downcase.gsub(" ", "_")}_error").visible?).to eq(true)

  # Alternatively..
  # case error_type
  # when "Computer name"
  #   expect(@create.computer_name_error.visible?).to eq(true)
  # when "Introduced date"
  #   expect(@create.computer_introduced_error.visible?).to eq(true)
  # when "Discontinued date"
  #   expect(@create.computer_discontinued_error.visible?).to eq(true)
  # else
  #   print "No error type declared"
  #   fail
  # end
end

Then("I filter by the computer name added") do
  filter_by(@table['Computer name'])
end
