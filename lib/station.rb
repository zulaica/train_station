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

end
