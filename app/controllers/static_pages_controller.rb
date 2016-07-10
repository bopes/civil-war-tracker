class StaticPagesController < ApplicationController
  def home
    @sides = Side.all
  end
end
