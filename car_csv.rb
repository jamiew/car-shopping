require 'rubygems'
require 'mechanize'

$agent = Mechanize.new
$agent.user_agent = "car_shopping.rb 001"
cars = []

def cars_from_url(url)
  page = $agent.get(url)
  (page/'.vehicleInfoColumn').map{|x|
    name = (x/'.YmmHeader a')[0].content.strip.gsub(',','-')
    year = name.match(/(\d+)\ /)[1]
    mileage = (x/'.mileageColumn')[0].content.gsub(',','').gsub('mi.','')
    price = (x/'.priceColumn')[0].content.gsub('$','').gsub(',','')
    next if price =~ /Not Priced/
    [year, name, mileage, price]
  }
end

# Outbacks & Foresters
#cars += cars_from_url("http://www.cars.com/for-sale/searchresults.action?toggleCpo=0&mkId=20041&mdId=21697&minp=0&prMx=17000&rd=100&zc=94117&AmbMkNm=Subaru&AmbMdNm=Outback&AmbMkId=20041&AmbMdId=21697&prMn=&stkTyp=U&cpo=&searchSource=QUICK_FORM&enableSeo=1&alMkId=20041&alMdId=21697")
#cars += cars_from_url("http://www.cars.com/for-sale/used/subaru/forester/_/N-ma9ZfgpZgbxZm5d?prMx=17000&sf1Dir=DESC&prMn=0&alMdId=21697&mkId=20041&rd=100&zc=94117&PMmt=1-0-0&stkTypId=28881&sf2Dir=ASC&sf1Nm=price&sf2Nm=miles&alMkId=20041&rpp=50&feedSegId=28705&searchSource=GN_REFINEMENT&crSrtFlds=stkTypId-feedSegId-mkId-pseudoPrice-mdId&pgId=2102&mdId=21165")

# Sonatas
cars += cars_from_url("http://www.cars.com/for-sale/searchresults.action?sf1Dir=DESC&mkId=20064&mdId=22146&rd=100&zc=94117&PMmt=1-1-0&stkTypId=28881&sf2Dir=ASC&sf1Nm=price&yrId=34923&yrId=27381&yrId=20201&yrId=20145&yrId=20200&yrId=20144&sf2Nm=miles&feedSegId=28705&searchSource=UTILITY&crSrtFlds=stkTypId-feedSegId-mkId-mdId-yrId&pgId=2102&rpp=250")

puts "year,name,mileage,price"
cars.each {|x|
  puts x.join(',')
}
