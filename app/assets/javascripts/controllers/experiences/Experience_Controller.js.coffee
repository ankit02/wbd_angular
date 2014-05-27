@ExperienceCtrl = ($scope, $location, $http, postData, flash) -> 
	
	$scope.data = postData.data

	postData.loadExperiences(null)

	$scope.newExperience = -> $location.url('/experience/new')

	$scope.viewExperience = (experienceId) -> $location.url('/experience/'+experienceId)

	$scope.deleteExperience = (experienceId) -> postData.deleteExperience(experienceId)

@ExperienceCtrl.inject = ['$scope', '$location', '$http' , 'postData', 'flash']	