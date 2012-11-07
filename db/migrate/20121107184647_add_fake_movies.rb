class AddFakeMovies < ActiveRecord::Migration
  FAKE_MOVIES = [
    {:title => 'Aladdin',                 :rating => 'G',     :release_date => '25-Nov-1992', :director => 'Ron Clements, John Musker'},
    {:title => 'The Terminator',          :rating => 'R',     :release_date => '26-Oct-1984', :director => 'James Cameron'},
    {:title => 'When Harry Met Sally',    :rating => 'R',     :release_date => '21-Jul-1989', :director => 'Rob Reiner'},
    {:title => 'The Help',                :rating => 'PG-13', :release_date => '10-Aug-2011', :director => 'Tate Taylor'},
    {:title => 'Chocolat',                :rating => 'PG-13', :release_date => '5-Jan-2001',  :director => 'Lasse Hallstrom'},
    {:title => 'Amelie',                  :rating => 'R',     :release_date => '25-Apr-2001', :director => 'Jean-Pierre Jeunet'},
    {:title => '2001: A Space Odyssey',   :rating => 'G',     :release_date => '6-Apr-1968',  :director => 'Stanley Kubrick'},
    {:title => 'The Incredibles',         :rating => 'PG',    :release_date => '5-Nov-2004',  :director => 'Brad Bird'},
    {:title => 'Raiders of the Lost Ark', :rating => 'PG',    :release_date => '12-Jun-1981', :director => 'Steven Spielberg'},
    {:title => 'Chicken Run',             :rating => 'G',     :release_date => '21-Jun-2000', :director => 'Peter Lord, Nick Park'},
  ]

  def up
    FAKE_MOVIES.each do |movie|
      Movie.create!(movie)
    end
  end

  def down
    FAKE_MOVIES.each do |movie|
      Movie.find_by_title_and_release_date(movie[:title], movie[:release_date]).destroy
    end
  end
end
