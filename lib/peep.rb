require 'pg'

class Peep
  def self.all
      connection = PG.connect(postgres://bgjkcvuwvvcwgl:5072876651dae60aacdfd0df563f495fcdd95be1856c5beee8688e77f7948edb@ec2-54-247-103-43.eu-west-1.compute.amazonaws.com:5432/d1gb2q6vdcsd1k

    result = connection.exec('SELECT * FROM peeps ORDER BY date DESC')
    result.map {  |peep | peep.values }
  end

  def self.create(message:, date:)
  connection = PG.connect(postgres://bgjkcvuwvvcwgl:5072876651dae60aacdfd0df563f495fcdd95be1856c5beee8688e77f7948edb@ec2-54-247-103-43.eu-west-1.compute.amazonaws.com:5432/d1gb2q6vdcsd1k
  )
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}')")
  end

  def self.search(keyword:)
      connection = PG.connect(postgres://bgjkcvuwvvcwgl:5072876651dae60aacdfd0df563f495fcdd95be1856c5beee8688e77f7948edb@ec2-54-247-103-43.eu-west-1.compute.amazonaws.com:5432/d1gb2q6vdcsd1k
      )
    result = connection.exec("SELECT * FROM peeps WHERE lower(message) LIKE '%#{keyword}%' ORDER BY date DESC")
    result.map { |peep | peep.values }
  end
end
