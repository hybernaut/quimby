module Foursquare
  class ListProxy
    def initialize(foursquare)
      @foursquare = foursquare
    end

    def find(id)
      Foursquare::List.new(@foursquare, @foursquare.get("lists/#{id}")["checkin"])
    end

    def all(options={})
      @foursquare.get("users/self/lists", options)["lists"]["items"].map do |json|
        Foursquare::List.new(@foursquare, json)
      end
    end

    def create(options={})
      if json = @foursquare.post("lists/add", options)
        Foursquare::List.new(@foursquare, json["list"])
      else
        nil
      end
    end
    alias_method :add, :create
  end
end
