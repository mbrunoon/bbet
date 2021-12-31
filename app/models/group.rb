class Group < ApplicationRecord

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

end
