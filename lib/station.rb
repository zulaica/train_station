class Station

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      name = station.fetch("name")
      id = station.fetch("id").to_i()
      stations.push(Station.new({:name => name, :id => id}))
    end
    stations
  end

  define_singleton_method(:find) do |id|
    found_station = nil
    Station.all().each() do |station|
      if station.id().eql?(id)
        found_station = station
      end
    end
    found_station
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:add_line) do |line_id|
    the_stop = Stop.new({:station_id => self.id(), :line_id => line_id})
    the_stop.save()
  end

  define_method(:==) do |another_station|
    self.name().==(another_station.name()).&(self.id().==(another_station.id()))
  end

end
