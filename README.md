Car Shopping
============

Some scripts I wrote while doing car purchase research.

**car_csv.rb** will collect year, price & mileage data from
a search results page on [Cars.com](http://cars.com) and dump to CSV

Usage
-----

Edit **car_csv.rb** and put in a cars.com search URL, like [this one](http://www.cars.com/for-sale/searchresults.action?toggleCpo=0&mkId=20041&mdId=21697&minp=0&prMx=17000&rd=100&zc=94117&AmbMkNm=Subaru&AmbMdNm=Outback&AmbMkId=20041&AmbMdId=21697&prMn=&stkTyp=U&cpo=&searchSource=QUICK_FORM&enableSeo=1&alMkId=20041&alMdId=21697)

PROTIP: set the search results limit to something high, since this script does not paginate.

1. `[sudo] gem install mechanize`
2. `ruby car_csv.rb > honda_accord.csv`
3. open the CSV in Excel and make a scatter plot
4. rinse & repeat for other makes/models
5. buy a car


License
-------

This source code made freely available under an MIT license

Authors
-------

* [Jamie Dubs](http://jamiedubs.com) ([@jamiew](https://github.com/jamiew))

