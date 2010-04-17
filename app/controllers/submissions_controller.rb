class SubmissionsController < ApplicationController
  
  def index
    @submission = Submission.new
    @projects = Submission.find(:all, :conditions => { :kind => 'project'}, :order => 'created_at DESC')
    @interests = Submission.find(:all, :conditions => { :kind => 'interest'}, :order => 'created_at DESC')
    
  end

  def create
    params[:submission]['kind'] = (params['commit'] == 'I am working on ...' ? 'project' : 'interest')
    
    Submission.create!(params[:submission])
    flash[:notice] = 'Submission received.'
    redirect_to(submissions_url)
  end
  
  def delete
    Submission.find_by_id(params[:submission][:id]).delete
    flash[:notice] = 'Submission deleted.'
    redirect_to(submissions_url)
  end
end
