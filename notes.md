# suggested database structure ala Chris. My data base looks different then this but keeping this here temporarily for debugging purposes.

# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000
_______________________________
This was reccomended in this tutorail: https://www.railstutorial.org/book/static_pages

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end
---------------------------------------------
<!-- <section>
  <h1>What's your speed?</h1>
  <div class="container" width="940px">
    <div class="row-fluid">
      <div class="span6 divide">
        <div class="container">
          <form action="">
            <div class="row">
              <div>
                <label>Lattitude</label><input class="span3" placeholder=" Lattitude" type="text">
                <label>Longitude</label><input class="span3" placeholder="Longitude" type="text">
                <div><button class="btn btn-primary">search</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section> -->


---------------------------------------------
THIS WORKS
require 'httparty'
require 'awesome_print'
# {API Base}/broadband/{dataVersion}/wireless?latitude={latitude}&longitude=-{longitude}&format={format}

# &maxresults={maxResults}
class Broadband_Wrapper
  BASE_URL = "https://www.broadbandmap.gov/broadbandmap/"
  DATA_VERSION = "jun2014"
  FORMAT = "json"
  LAT_SEARCH = "34.04"
  LONG_SEARCH = "-111.09"

  def self.search_broadband()
    url = BASE_URL + "broadband/" + "#{DATA_VERSION}" + "/wireless?" + "latitude=#{LAT_SEARCH}" + "&longitude=#{LONG_SEARCH}" + "&format=#{FORMAT}"

    data = HTTParty.get(url)
    search_results = []
    data["Results"].each do |result|
      resource = result["wirelessServices"]
      search_results << build_data(resource)
    end
    search_results
  end

  def self.build_data(resource)
    name = resource["providerName"]
    company = resource["doingBusinessAs"]
    max_ad_download = resource["technologies"]["maximumAdvertisedDownloadSpeed"]

    max_ad_upload = resource["technologies"]["maximumAdvertisedUploadSpeed"]
    maximumDownload = resource["technologies"]["maximumDownloadScore"]
    maximumUpload = resource["technologies"]["maximumUploadScore"]
    Resource.new(name, company, max_ad_download, max_ad_upload, maximumDownload, maximumUpload)
  end


end


------------------------------------------------
Great definitions for tricky concepts seen here. Will be helpful when attempting to describe the data.

https://www.broadbandmap.gov/classroom/download-upload#advertised-download-speed

Maximum Advertised Download Speed

On the National Broadband Map, this is the maximum download speed that a broadband provider advertises in an area. This usually represents the maximum download speed that the network can provide. Actual performance depends on a number of factors that may include your computer, network congestion due to other users, and the location of your home or business, among others.



https://www.broadbandmap.gov/broadbandmap/geography/tribalnation?format=json&all=true


https://www.broadbandmap.gov/developer/api/speed-test-api-minimum-and-maximum-quartile-speeds-by-geography-type next api call

------------------------------
<% @search_results.each do |item|  %>
  <ul>
    <li><strong>Name: </strong><%=item.name  %> </li>
    <li> Company: <%=item.company %> </li>
    <li> Max Advertised Download Speed: <%=item.max_ad_download %> </li>
    <li>Max Advertised Upload Speed: <%=item.max_ad_upload %></li>
    <li> Max Download Speed: <%=item.max_download %></li>
    <li> Max Upload Speed: <%=item.max_upload %></li>
  </ul>
<% end %>
