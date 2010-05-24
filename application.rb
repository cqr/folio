#!/usr/bin/env ruby
require 'sinatra'
load File.join(File.dirname(__FILE__), 'environment.rb')
# Add your application code below this line.

helpers do
  def title(string = nil)
    @title ||= 'Chris Rhoden\'s Portfolio'
    @title << ' :: ' + string.to_s if string
    @title
  end
  
  def logged_in?
    session[:authenticated]
  end
  
  def require_login
    redirect '/login' unless logged_in?
  end
  
  def current_url
    request.uri
  end
  
end

use Rack::Session::Cookie
use Rack::Flash

get '/' do
  @projects = Project.all
  haml :projects_list
end

get '/application.css' do
  content_type :css
  sass :application, :layout => false
end

get '/login' do
  haml :login
end

post '/login' do
  if params[:username] == 'chrisrhoden' and params[:password] == 'mypass'
    session[:authenticated] = true
    redirect_to Project
  else
    haml :login
  end
end

get '/logout' do
  session[:authenticated] = nil
  redirect '/'
end

get '/projects/?' do
  redirect '/'
end

get '/tools/:slug/?' do
  @tool = Tool.find_by_slug(params[:slug])
  return haml :tool if @tool
  flash[:error] = 'Invalid tool!' and redirect_to Project
end

get '/tools/?' do
  @tools = Tool.all(:order => 'name ASC')
  max, min = 0, 99999
  @tools.each do |tool|
    max = tool.projects.size if max < tool.projects.size
    min = tool.projects.size if min > tool.projects.size
  end
  delta = max - min
  @size = {}
  @size[max] = 10
  @size[min] = 1
  ((min+1)...max).each do |n|
    @size[n] = ((10.0 * (n-min))/delta.to_f).ceil
  end
  haml :tools_list
end 

get '/projects/new' do
  require_login
  @project = Project.new
  haml :edit_project
end

get '/projects/:slug/edit' do
  require_login
  @project = Project.find_by_slug(params[:slug])
  if @project
    haml :edit_project
  else
    flash[:error] = 'Invalid project identifier!'
    redirect_to Project
  end
end

get '/projects/:slug/?' do
  @project = Project.find_by_slug(params[:slug])
  if @project
    haml :project
  else
    flash[:error] = 'Invalid Project Identifier!'
    redirect_to Project
  end
end

post '/projects' do
  require_login
  @project = Project.new(params[:project])
  if @project.save
    flash[:success] = 'Project created'
    redirect_to @project
  else
    haml :edit_project
  end
end

put '/projects/:slug' do
  require_login
  @project = Project.find_by_slug(params[:slug])
  if @project
    @project.update_attributes(params[:project])
    if @project.save
      flash[:success] = 'Project updated.'
      redirect_to @project
    else
      haml :edit_project
    end
  else
    flash[:error] = 'Invalid project identifier!'
    redirect_to Project
  end
end