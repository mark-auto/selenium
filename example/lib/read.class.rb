class Read < SitePrism::Page
  elements :table_headers, '.zebra-striped thead th'
  elements :table_rows,    '.zebra-striped tbody tr'
  element  :header,        '#main h1'
  element  :table_count,   '.current'

  def map_current_page
    # Create an array of hashes (key/value pairing) that match the table data - IE copy the table data and output

    # Create an empty array
    results = []

    # Make note of the table headers
    headers = table_headers.map(&:text)

    # For each row..
    table_rows.each do |row|

      # Create an empty hash
      data = {}

      # For each cell (making note of the index)..
      row.all('td').each_with_index do |record, i|

        # Set the key as the table header associated with the index of the current cell
        # Assign the value as the text in the current cell
        data[headers[i]] = record.text
      end

      # Push current hash to the array
      results.push(data)
    end

    # Output the completed array
    results
  end
end
