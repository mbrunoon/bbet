class Group < ApplicationRecord

	alias_attribute :parent_id, :major_group
	alias_attribute :parent, :major_group

	validates :name, presence: true

	validate :major_group_cannot_be_zero
	validate :major_group_cannot_reference_itself

	def major_group_cannot_be_zero
		if major_group == 0
			errors.add(:major_group, "Major group must be non-zero id group")
		end
	end

	def major_group_cannot_reference_itself
		if !major_group.blank? and major_group == id
			errors.add(:major_group, "Major group cannot reference itself")
		end
	end

	def techiniques
		Technique.where(group: self.subgroups)		
	end

	def subgroups(subgroups_array = [])
		subgroups = Group.where(major_group: id)
		subgroups_array += subgroups.all
		subgroups.each do |group|
			group.subgroups(subgroups_array)
		end
		subgroups_array
	end

end
