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
    services = data["Results"]["wirelessServices"]
    services.each do |service|
      search_results << build_data(service)
    end
    search_results
  end

  # def self.build_tech(service)
  #   tech = service["technologies"]
  #   tech.each do |info|
  #     max_ad_download = info["maximumAdvertisedDownloadSpeed"]
  #     max_ad_upload = info["maximumAdvertisedUploadSpeed"]
  #     maximumDownload = info["maximumDownloadScore"]
  #     maximumUpload = info["maximumUploadScore"]
  #
  #     tech_results << build_data(service)
  #   end
  #   tech_results
  # end




  def self.build_data(service)
    name = service["providerName"]
    company = service["doingBusinessAs"]
    max_ad_download = service["maximumAdvertisedDownloadSpeed"]

    # max_ad_upload = ["technologies"]["maximumAdvertisedUploadSpeed"]
    # maximumDownload = ["technologies"]["maximumDownloadScore"]
    # maximumUpload = ["technologies"]["maximumUploadScore"]
    Service.new(name, company, max_ad_download, max_ad_upload, maximumDownload, maximumUpload)
  end


end
