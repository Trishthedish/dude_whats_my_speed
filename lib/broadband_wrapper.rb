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
