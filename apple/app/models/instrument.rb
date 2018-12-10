class Instrument < ApplicationRecord

mount_uploader :image,Imageuploader

serialize :Image,JSON

belongs_to_users,optional: true
validate :title,:brand,:price,:model,: true
validate :description,length:{maximum:1000,true,too_long:"% {count}characters is the maximum aloud."} 
validate :title,Length:{maximum:1000,true,too_long:"% {count}characters is the maximum aloud."}
validate :price,numericality:{only_integer:true},length:{maximum:7}
 BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end





end
