class Admin::RulesController < ApplicationController
  
  def index
    @rules = Rule.all
    @new_rule = Rule.new
  end
  
  def create
    @rule = Rule.new(content: [rule_params[:content][:attribute], rule_params[:content][:operation], rule_params[:content][:value]])
    @rule.save

    @rules = Rule.all
    @new_rule = Rule.new
    respond_to do |format|
      format.js {}
    end
  end
  
  def destroy
    @rule = Rule.find(params[:id])
    if @rule.destroy
      redirect_to admin_rules_path
    end
  end
  
  private
  
  def rule_params
    params.require(:rule).permit(content: [:attribute, :operation, :value])
  end
end
