class Spree::News < ActiveRecord::Base
  self.table_name = 'spree_news'
  validates_presence_of :title, :description

  scope :published, -> { where(published: true) }
  scope :latest, -> { order('created_at DESC').limit(3) }
end
