class Snacks < ApplicationController
  def new
    @snack = Snack.new
  end
end
