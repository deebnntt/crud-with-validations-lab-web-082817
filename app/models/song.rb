class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, :artist_name, presence: true, unless: Proc.new {|a|a.released == false}
  validate :check_release_year

  def check_release_year
    if release_year
      if self.release_year > Time.now.year
        self.errors[:release_year] << "Year is in future"
      else
      end
    end
  end


end
