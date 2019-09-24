class LabelsController < ApplicationController
    before_action :authenticate_admin!
  def new
    @label = Label.new
    @labels = Label.all
  end

  def create
    label = Label.new(label_params)
    if label.save
    redirect_to new_label_path 
    else
    redirect_to new_label_path , notice: "名前がありません"
    end
   
  end
  
  def edit
    @label = Label.find(params[:id])
  end

  def update
    label = Label.find(params[:id])
   
    if  label.update(label_params)
    redirect_to new_label_path 
    else
    redirect_to edit_label_path , notice: "名前がありません"
    end
  end

  private
    def label_params
          params.require(:label).permit(:label)
    end
end
