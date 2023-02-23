class Movie < ActiveRecord::Base
    module Create
      def create_with_title(title)
        movie = Movie.new
        movie.title = title
        movie.save
        movie
      end
    end
  
    extend Create
  
    def self.first_movie
      Movie.first
    end
  
    def self.last_movie
      Movie.last
    end
  
    def self.movie_count
      Movie.count
    end
  
    def self.find_movie_with_id(id)
      Movie.find_by(id: id)
    end
  
    def self.find_movie_with_attributes(attributes)
      Movie.where(attributes).first
    end
  
    def self.find_movies_after_2002
      Movie.where('release_date > ?', 2002)
    end
  
    def update_with_attributes(attributes)
      update(attributes)
    end
  
    def self.update_all_titles(title)
      Movie.update_all(title: title)
    end
  
    def self.delete_by_id(id)
      movie = Movie.find_by(id: id)
      movie.delete if movie
    end
  
    def self.delete_all_movies
      Movie.destroy_all
    end
  end
  