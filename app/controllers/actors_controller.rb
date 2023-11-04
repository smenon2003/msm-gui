class ActorsController < ApplicationController
  def update
    some_id = params.fetch("some_id")
    matching_records = Actor.where({ :id => some_id})
    the_actor = matching_records.at(0)
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image1")
    the_actor.save
    redirect_to("/actors/#{the_actor.id}")
  end 
  
  def create
    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image1")

    a.save

    redirect_to("/actors")
  end 

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })
    render({ :template => "actor_templates/index" })
  end


  def show
    the_id = params[:id]

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end


def destroy
  act_id = params.fetch("a_id")
  matching_records = Actor.where({ :id => act_id })
  the_actor = matching_records.at(0)
  the_actor.destroy
  redirect_to("/actors")
end 
end 
