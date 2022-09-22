require "csv"

MAX_LENGTH_DATA = 100000
HO = ["Nguyen","Do","Le","Ho","Vu","Vo","Phan","Bui","Ngo","Dang","Hoang","Tran","Pham","Huynh","Duong"]
DEM = ["Van","Ha","Trang","Anh","Yen","Thu","Nga","Mai","Hoa"]

arr = HO.product(DEM)
phone = "0123456789"
address = "Ho Chi Minh city"
date = "2000/01/01"
profile = "Like TV 100\", Some special charactor: \\ / ' $ ~ & @ # ( ;\""

CSV.open("user_data.csv", "wb") do |csv|
  csv << ["name", "email", "phone","address","date","profile"]
  j = 0
  ascii = 65

  (1..MAX_LENGTH_DATA).each { |i|
    if(i % 10000 == 0) #Nguyen Van A -> Nguyen Van B
      ascii += 1
    end

    if(i%100000 == 0) #Ho[0]Ten[0] - >Ho[0]Ten[1] 
      ascii = 65
      j += 1
    end

    name = arr[j].join(' ')+ ' ' + ascii.chr + ' ' + (i%1000).to_s;
    email = (arr[j].join(' ') + ascii.chr + (i%1000).to_s).delete(' ').downcase + '@gmail.com'
    
    csv << [name, email, phone, address, date, profile]
  }

end

