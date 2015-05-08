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

   define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylists.all().each() do |stylist|
      if stylist.id().to_i == (id).to_i
        found_stylist = stylist
      end
    end
    found_stylist
  end

  
end
