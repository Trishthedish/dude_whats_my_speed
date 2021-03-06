require 'httparty'
require 'awesome_print'

# require 'service'
# {API Base}/broadband/{dataVersion}/wireless?latitude={latitude}&longitude=-{longitude}&format={format}

# &maxresults={maxResults}
class Broadband_Wrapper

  # def initialize()
  #   speed_inf
  # end
  BASE_URL = "https://www.broadbandmap.gov/broadbandmap/"
  DATA_VERSION = "jun2014"
  FORMAT = "json"
  # LAT_SEARCH = "34.04"
  # LONG_SEARCH = "-111.09"

  def self.search_broadband(lat_search, long_search)
    url = BASE_URL + "broadband/" + "#{DATA_VERSION}" + "/wireless?" + "latitude=#{lat_search}" + "&longitude=#{long_search}" + "&format=#{FORMAT}"

    data = HTTParty.get(url)
    search_results = []
    results_data = data["Results"]

    results_data["wirelessServices"].each do |service|

      @name = service["providerName"]
      @company = service["doingBusinessAs"]
      @speed_info = service["technologies"]
      search_results << build_data(@speed_info[0])
    end
    search_results

  end

  def self.build_data(speed_info)

      @max_ad_download = speed_info["maximumAdvertisedDownloadSpeed"]
      @max_ad_upload = speed_info["maximumAdvertisedUploadSpeed"]
      @max_download = speed_info["maximumDownloadScore"]
      @max_upload = speed_info["maximumUploadScore"]
      #
      # Resource.new(@name, @company, @max_ad_download, @max_ad_upload, @max_download, @max_upload)

      Service.new(@name, @company, @max_ad_download, @max_ad_upload, @max_download, @max_upload)
  end


end
