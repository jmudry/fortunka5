class Fortune < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  ajaxful_rateable :stars => 5,:allow_update => true, :dimensions => [:body]
  paginates_per 10

  validates :body, :presence => true
  validates_length_of :body, :in => 2..255
  validates_uniqueness_of :body, :case_sensitive => false

  def self.search(search)
  if search
    where('body LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
