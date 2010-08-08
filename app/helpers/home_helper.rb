module HomeHelper
  
  def safeURL(url)
  
    rtn = ""
    if url != nil
      if url.include? "http"
        rtn = url
      else
        rtn = "http://" + url
      end
    end
  
    return rtn
  end
  
end
