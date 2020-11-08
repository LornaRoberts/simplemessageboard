require 'pg'

class Peep
  def self.all
      connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps ORDER BY date DESC')
    result.map {  |peep | peep.values }
  end

  def self.create(message:, date:)
  connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}')")
  end

  def self.search(keyword:)
      connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps WHERE lower(message) LIKE '%#{keyword}%' ORDER BY date DESC")
    result.map { |peep | peep.values }
  end
end
