class MainController < ApplicationController

	def index
		major_groups = Group.where(major_group: nil)
		random_techniques_by_group = []

		major_groups.map do |group|
			techniques = group.techniques.order("RANDOM()").limit(10)
			random_techniques_by_group << { 
				name: group.name, 
				techniques: techniques.map{ |technique| { 
					name: technique.name, 
					url: technique.url,
					group: technique.group.name
					}
				} 
			}
		end

		render json: random_techniques_by_group
	end

end
