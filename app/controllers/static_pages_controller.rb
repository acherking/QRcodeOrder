# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
    @food_types = FoodType.all
  end
end
