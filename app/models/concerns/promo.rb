class Promo < ActiveReord::Base
validates_presence_pf :title, :product
calidates_numericality_of :discount, {greater_than: 0, lower_than: 100}

belongs_to :product





