class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_union(search_class)
    union = Side.find_by(name: "The Union")
    search_class.where(side: union)
  end

  def find_confederates(search_class)
    confederacy = Side.find_by(name: "The Confederacy")
    search_class.where(side: confederacy)
  end

end
