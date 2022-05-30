Given("I update the computer details to be:") do |table|
  @table = table_data(table)

  @create = Create.new

  @create.add_new_computer(@table)

  click_button("Save this computer")
end

When("I open the details for {string}") do |computer_name|
  click_link(computer_name)

  expect(Create.new.computer_name.value).to eq(computer_name)
end

Then("I expect the computer details to be updated accordingly") do
  res = Read.new.map_current_page.first

  # Normalise date to be a single format, so they can be directly compared
  introduced_date = normalise_date(res['Introduced'])
  discontinued_date = normalise_date(res['Discontinued'])

  expect(introduced_date).to eq(@table['Introduced date'])
  expect(discontinued_date).to eq(@table['Discontinued date'])

  expect(res['Computer name']).to eq(@table['Computer name'])
  expect(res['Company']).to eq(@table['Company'])
end

def normalise_date(this)
  default_date = Date.parse(this.gsub(" ", "/"))

  # Add the preceeding zero
  new_day = default_date.strftime("%d")
  new_month = default_date.strftime("%m")

  # Output a full string using a common format
  "#{default_date.year}-#{new_month}-#{new_day}"
end
