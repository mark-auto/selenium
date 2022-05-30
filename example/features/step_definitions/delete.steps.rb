When("I select to delete the computer") do
  # Open the applicable record (by finding the computer name in the table)
  all('td').select {|cell| cell.text == @table['Computer name']}.first.find('a').click

  click_button("Delete this computer")
end

Then("I expect to see a confirmation of the deleted record") do
  expect(@common.alert.text).to eq("Done! Computer has been deleted")
end

Then("I expect no filter results to be returned") do
  filter_by(@table['Computer name'])

  no_results_message
end

def no_results_message
  expect(Delete.new.empty_table.text).to eq("Nothing to display")
end
