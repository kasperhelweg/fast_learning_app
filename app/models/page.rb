class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  # Associations
  belongs_to :pageable, :polymorphic => true

  # Accesible
  attr_accessible :title, :glyph, :desc, :content
  
  # Callbacks
  before_create :create_id_hash

  # Validations
  validates :title, :content, presence: true  

  ##############################################################
  # Public interface
  ##############################################################

  #def to_param
  #  id_hash
  #end

  ##############################################################
  # Private interface
  ##############################################################
  private

  def create_id_hash
    unique_string = self.title + "-" + self.pageable_id.to_s
    self.id_hash = Digest::SHA2.hexdigest(unique_string)[0..6]
  end

end
