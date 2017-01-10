class Service
  attr_reader :name, :company, :max_ad_download, :max_ad_upload, :max_download, :max_upload


  def initialize(name, company, max_ad_download, max_ad_upload, max_download, max_upload)

    @name = name
    @company = company
    @max_ad_download = max_ad_download
    @max_ad_upload = max_ad_upload
    @max_download = max_download
    @max_upload = max_upload

    if name == nil || name == "" || company = nil || company == "" || max_ad_download == nil || max_ad_download == "" || max_ad_upload == nil || max_ad_upload == "" || max_download == nil || max_download == "" || max_upload == nil || max_upload == ""

    end


  end

end
