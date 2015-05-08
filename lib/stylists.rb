class Stylists
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylists.fetch("name")
      id = stylists.fetch("id").to_i()
      stylists.push(Stylists.new({:name => name, :id => id}))
    end
    stylists
    end

    define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
