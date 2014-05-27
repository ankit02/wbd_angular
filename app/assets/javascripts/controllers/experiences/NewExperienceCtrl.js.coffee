@NewExperienceCtrl = ($scope, $location, postData, flash) ->
	
	$scope.data = postData.data

	postData.loadExperiences(null)

	$scope.newExperience = 
		experience_name: ''
		special: ''
		budget: ''
		description: ''

	$scope.createExperience = ->
		postData.createExperience($scope.newExperience)

@NewExperienceCtrl.$inject = ['$scope', '$location', 'postData', 'flash']			