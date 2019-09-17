class OrderLogsController < ApplicationController
  def index
    @recept_logs=ReceptLog.all
  end
end
