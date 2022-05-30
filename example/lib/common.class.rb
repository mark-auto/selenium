class Common < SitePrism::Page
  element :page_title,    '#main h1'
  element :alert,         '.alert-message'
  element :filter_input,  '#searchbox'
  element :submit_search, '#searchsubmit'

  def filter_by(data)
    # Set the variable to the input field
    filter_input.set(data)

    # Click search
    submit_search.click
  end
end
