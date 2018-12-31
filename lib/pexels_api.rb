class PexelsApi
  def self.get_sample_image(category)
    conn = Faraday.new(url: 'https://api.pexels.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params = {
        query: category,
        per_page: 1,
        page: rand(1..800)
      }

      faraday.headers = {
        'Authorization': '563492ad6f9170000100000121f1580e60954e3382381b923a2d1993'
      }
    end

    response = conn.get('v1/search')



    # Decodes api JSON response and search for data on a safe operator environment
    image_string = JSON.parse(response.body)&.[]("photos")&.first&.[]("src")&.[]("medium")

    # Webmock cant return a hash or a Faraday instance on test environment
    # So I'll add a fallback code for testing purpose
    # https://github.com/bblimke/webmock/issues/449
    image_string ||= JSON.parse(response)&.[]("photos")&.first&.[]("src")&.[]("medium")

  end
end
