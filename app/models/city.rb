class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  

  def city_openings(arrive, leave) 
    
    a = Date.parse(arrive)
    l = Date.parse(leave)
    openings = []
    #binding.pry
    self.listings.each do |e| 
      e.reservations do |r|
        #binding.pry
        if a >= r.checkout and  l <= r.checkin
          return e
        end
      end
    end
    
  end

end

