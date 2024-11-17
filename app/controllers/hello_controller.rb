class HelloController < ApplicationController
  def index
    render json: { message: "Hello World Ruby on, Rails How are you" }
  end
end
