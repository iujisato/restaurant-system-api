class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_create do

    self.sample_image = get_sample_image
  end

  def get_sample_image
    conn = Faraday.new(url: 'https://api.pexels.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params = {
        query: 'restaurant',
        per_page: 1,
        page: rand(1..1082)
      }

      faraday.headers = {
        'Authorization': '563492ad6f9170000100000121f1580e60954e3382381b923a2d1993'
      }
    end

    response = conn.get('v1/search')

    # Decodes api JSON response and search for data on a safe operator environment
    JSON.parse(response.body)&.[]("photos")&.first&.[]("src")&.[]("medium")
  end
end
