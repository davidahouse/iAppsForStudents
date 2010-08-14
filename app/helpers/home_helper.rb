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
  
  def currSymbol(currency)
  
    if currency == "USD"
      return 'USD '
    elsif currency == "GBP"
      return "£"
    elsif currency == "EUR"
      return "€"
    else
      return '$'
    end
  end
end
