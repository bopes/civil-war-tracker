class StaticPagesController < ApplicationController
  def home
    @union = Side.find_by(name: "The Union")
    @confederacy = Side.find_by(name: "The Confederacy")
  end
end
