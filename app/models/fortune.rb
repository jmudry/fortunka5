class Fortune < ActiveRecord::Base
   paginates_per 10
  validates :body, :presence => true
  # validates_presence_of :body
  validates_length_of :body, :in => 2..128
  # validates_length_of :body, :minimum => 2, :maximum => 128
  validates_uniqueness_of :body, :case_sensitive => false

  def self.search(search)
  if search
    where('body LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
