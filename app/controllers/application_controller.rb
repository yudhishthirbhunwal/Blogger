class ApplicationController < ActionController::Base
  # Defining root action.
  def index
    render html: "I am going to be the best blogging app everr!!!!!"
  end
end
