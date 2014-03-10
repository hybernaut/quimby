module Foursquare
  class Group

    def initialize(foursquare, json)
      @foursquare, @json = foursquare, json
      @json["items"].map do |item|
        Foursquare::List.new(@foursquare, item)
      end
    end

    def name
      @json["name"]
    end

    def type
      @json["type"]
    end

    def count
      @json["count"]
    end

    # array
    def items
      @json["items"]
    end

  end
end