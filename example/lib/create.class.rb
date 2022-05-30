class Create < SitePrism::Page
  element :computer_name,     '#name'
  element :introduced_date,   '#introduced'
  element :discontinued_date, '#discontinued'
  element :company,           '#company'

  # Errors
  element :computer_name_error,         '.error #name'
  element :introduced_date_error,   '.error #introduced'
  element :discontinued_date_error, '.error #discontinued'

  def add_new_computer(data)
    # Handles data being passed through, allowing for empty fields to be accepted
    computer_name.set(data['Computer name']) if data.has_key? 'Computer name'
    introduced_date.set(data['Introduced date']) if data.has_key? 'Introduced date'
    discontinued_date.set(data['Discontinued date']) if data.has_key? 'Discontinued date'

    # Select from drop down list
    select "#{data['Company']}", :from => "company" if data.has_key? 'Company'
  end
end
