class Classroom < ActiveRecord::Base
  
  # Associations
  belongs_to :course
  has_many   :enrollments, :dependent => :destroy 
  has_many   :users, :through => :enrollments

  has_many :pages,  :as => :pageable, :dependent => :destroy
  has_many :resources, :as => :attachable

  # Accesible
  attr_accessible :online_date

  # Callbacks
  before_create :create_id_hash
  before_create :set_dates

  # Validations
  validates              :online_date, presence: true  
  validates_presence_of  :course
  
  ##############################################################
  # Public interface
  ##############################################################

  def to_param
    id_hash
  end

  ##############################################################
  # Private interface
  ##############################################################
  private

  def create_id_hash
    unique_string = self.course.title + "-" + self.online_date.to_s
    self.id_hash = Digest::SHA2.hexdigest(unique_string)[0..6]
  end

  def set_dates
    self.starts = self.online_date - 14
    self.ends = self.online_date + 14
  end
  
end
