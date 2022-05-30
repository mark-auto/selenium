Given("I make note of the table data") do
  @read ||= Read.new

  @table_data = @read.map_current_page
end

Then("I expect the table content to be valid") do
  @table_data.each do |row|
    expect(row['Computer name']).to match(/\w+/)

    # This could be mapped to a list of valid company names, akin to the drop down
    expect(row['Company']).to match(/\w+/).or eq("-")

    validate_date(row['Introduced'])
    validate_date(row['Discontinued'])
  end
end

def validate_date(this)
  # The hyphen record represents a blank row
  # Given time, I'd likely replace that hyphen with an empty value
  return if this == "-"

  # Convert date to a recognized format
  x = Date.parse(this.gsub(" ", "/"))

  expect(Date.valid_date?(x.year,x.month,x.day)).to eq(true)
end

Given("I make note of the number of computers found") do
  @read ||= Read.new

  # Read the header string and return the numbers only
  @computers_found = @read.header.text.scan(/\d/).join('')
end

Given("I make note of the number of computers in the table") do
  # Read the table record count string and return the numbers only
  @computers_in_table = @read.table_count.text.scan(/\d+$/).join('')
end

Then("I expect the number of computers to match") do
  expect(@computers_found).to eq(@computers_in_table)
end

Then("I expect a single result to be returned") do
  expect(Read.new.map_current_page.count).to eq(1)
end

Then("I expect a multiple results to be returned") do
  expect(Read.new.map_current_page.count).to be > 1
end

Then("I expect no results to be found") do
  no_results_message
end
