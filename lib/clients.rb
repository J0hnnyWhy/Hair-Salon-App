class Clients
attr_reader(:person, :stylist_id)

  define_method(:initialize) do |attributes|
    @person = attributes.fetch(:person)
    @stylist_id = attributes.fetch(:stylist_id)
  end

    define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      person = client.fetch("person")
      stylist_id = client.fetch("stylist_id").to_i() 
      clients.push(Clients.new({:person => person, :stylist_id => stylist_id}))
    end
    clients
  end


  define_method(:==) do |another_client|
    self.person().==(another_client.person()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@person}', #{@stylist_id});")
  end


end