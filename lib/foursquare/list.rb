module Foursquare
  class List
    attr_reader :json

    def initialize(foursquare, json)
      @foursquare, @json = foursquare, json
    end

    def id
      @json["id"]
    end

    def fetch
      @json = @foursquare.get("lists/#{id}")["checkin"]
      self
    end

    def name
      @json["name"]
    end

    def description
      @json["description"]
    end

    def following
      @json["following"]
    end

    def user(full=false)
      fetch unless @json["user"]

      if full
        @foursquare.users.find(@json["user"]["id"])
      else
        Foursquare::User.new(@foursquare, @json["user"])
      end
    end
  end
end
