class SubmissionsController < ApplicationController
  
  def index
    @submission = Submission.new
    @projects = Submission.find(:all, :conditions => { :kind => 'project'})
    @interests = Submission.find(:all, :conditions => { :kind => 'interest'})
    
  end

  def create
    params[:submission]['kind'] = (params['commit'] == 'I am working on ...' ? 'project' : 'interest')
    
    Submission.create!(params[:submission])
    redirect_to(submissions_url)
  end
end
